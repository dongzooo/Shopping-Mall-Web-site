package com.admin.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.admin.domain.BoardVO;
import com.admin.domain.Criteria;
import com.admin.domain.FaqBoardVO;
import com.admin.domain.FaqTempVO;
import com.admin.domain.FaqVO;
import com.admin.domain.OrderVO;
import com.admin.domain.PageDTO;
import com.admin.domain.QnaTempVO;
import com.admin.domain.QnaVO;
import com.admin.service.AdminBoardNoticeService;
import com.admin.service.AdminService;
import com.admin.service.BoardFAQService;
import com.admin.service.BoardService;
import com.member.domain.MemCouponVO;
import com.member.domain.MemberVO;
import com.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/adminPage/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("payComplete")
	public String payComplete(OrderVO order) {
		System.out.println(order);
 		adminService.addOrder(order);
 		return "/main/home";
	}
	
	@GetMapping("adminMainMenu")
	public void adminMainMenu() {
		log.info("운영자 관리 페이지 호출");
	}
	
	@GetMapping("memberList")
	public void memberList(Model model) {
		log.info("회원 리스트 페이지 호출");
		
		List<MemberVO> memberList = memberService.getMemberList();
		
		model.addAttribute("memberList", memberList);
	}
	
	@GetMapping("memberDetail")
	public void memberDetail(@RequestParam("id") String id, Model model, HttpServletRequest request) {
		log.info(id);
		String mem_id = request.getParameter("id");
		MemberVO member = memberService.getMember(mem_id);
		model.addAttribute("member", member);
	}
	
	@PostMapping("memberModi")
	public void memberModi(MemberVO member, Model model, String seller) {
		int pnt = memberService.getPoint(member.getId());
		if(member.getPoint() > 0) {
			member.setPoint(pnt + member.getPoint());
		}else {
			member.setPoint(pnt);
		}
		if(!seller.isEmpty()) {
			memberService.modiAuth(seller, member.getId());
		}
		int result = memberService.MemberModi(member);
		model.addAttribute("result", result);
	}
	
	@PostMapping("oneDeleteMem")
	public void oneDeleteMem(String id, Model model) {
		MemberVO member = memberService.getMember(id);
		int result = memberService.deleteMember(member);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("giftCoupon")
	public String giftCoupon(String id, Model model) {
		model.addAttribute("id", id);
		System.out.println(id);
		return "adminPage/giftCoupon";
	}
	
	@PostMapping("directCoupon")
	public void directCoupon(MemCouponVO coupon) {
		System.out.println("쿠폰: "+ coupon.getCoupon_num() + "아이디: "+ coupon.getMem_id());
		memberService.saveCoupon(coupon);
	}
	
	
	//--------------------------------NOTICE------------------------------------------------------------------
	@Autowired
	private AdminBoardNoticeService adminBoardNoticeService; 
	@Autowired
	private BoardService boardService; 
	
	
	@GetMapping("/notice/write")
	public void noticeWrite(Model model) {
		System.out.println("write get요청!!!");
		model.addAttribute("cate", adminService.getCate());
	}
	
	@PostMapping("/notice/write")
	public String noticeWritePro(BoardVO board, RedirectAttributes rttr) {
		// DB에 저장처리 
		adminBoardNoticeService.register(board);
		log.info(board);
		// 리다이렉트할때 데이터 전송하는 방법중 하나로, 
		// 데이터를 일회성으로만 전달하고 싶을때 이 클래스의 ...Flash 메서 사용. 
		rttr.addFlashAttribute("result", board.getBoard_no());  
		
		return "redirect:/adminPage/notice/list";
	}
	
	@GetMapping("/notice/list") // list 요청시 pageNum, listQty 가 들어와야함.
	public void list(Criteria cri, Model model) {
		//model.addAttribute("list", adminBoardNoticeService.getList());

		// 페이징처리 버전!! 
		// 현재 페이지 번호에 따른, 보여줄 글 목록 가져와 view에 전달 
		model.addAttribute("list", adminBoardNoticeService.getList(cri));
		
		// 전체 글의 개수 가져오고 
		int total = adminBoardNoticeService.getTotal(cri); 
		// 화면에 띄워줄 페이지번호등 계산완료된 PageDTO 객체도 view전달 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping({"/notice/content", "/notice/modify", "/notice/delete"})
	public void content(@RequestParam("board_no") Long bno, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("board", adminBoardNoticeService.get(bno)); 
		model.addAttribute("cate", adminService.getCate());
	}
	
	@PostMapping("/notice/modify") 
	public String noticeModify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		System.out.println(cri);
		boolean res = adminBoardNoticeService.modify(board);
		if(res) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminPage/notice/list" + cri.getParameterLink(); 
	}
	@PostMapping("/notice/delete")
	public String noticeDelete(@RequestParam("board_no") Long bno, Criteria cri, RedirectAttributes rttr) {
		if(adminBoardNoticeService.remove(bno)) {
			rttr.addFlashAttribute("result", "success"); 
			
		}
		return "redirect:/adminPage/notice/list" + cri.getParameterLink();
	}
	
	//--------------------------------QNA 카테고리------------------------------------------------------------------
	@RequestMapping("qnaConfig")
	public String qnaConfig( Model model) {
		log.info("qnaConfig 페이지 호출");
	
		// 데이터 베이스에 저장된 등록 QNA카테고리 데이터 가져오기
		List<QnaVO> cateList = adminService.getCate();
		List<QnaTempVO> cateTempList = adminService.getTempCate();
		
		model.addAttribute("cateTempList", cateTempList);
		model.addAttribute("cateList", cateList);
		
		return "adminPage/qnaConfig";
	}
	
	@RequestMapping("qnaAdd")
	public String qnaAdd() {
		
		return "adminPage/qnaAdd";
	}
	
	@PostMapping("qnaTempAdd")
	public String qnaTempAdd(HttpServletRequest request, Model model) {
		//입력한 값 가져오기
		String categoryName = request.getParameter("catName");
		//추가버튼 클릭하여 새로운 미등록 카테고리 temp에 추가
		if(categoryName != null) {
			adminService.addTempQna(categoryName);
		}
		return "adminPage/qnaConfig";
	}
	
	// 등록시
	@PostMapping("qnaReg")
	public String qnaReg(String unreg, String unreg_index, HttpServletRequest request, Model model) {
		log.info("qnaReg 처리 요청");
		
		int idx = Integer.parseInt(unreg_index.substring(5));
		adminService.removeTempQna(idx);
		adminService.addQna(unreg);
		
		return "adminPage/qnaConfig";
	}
	
	// 등록해제시
	@PostMapping("qnaDeReg")
	public String qnaDeReg(String reg, String reg_index, Model model) {
		
		Integer idx = Integer.parseInt(reg_index.substring(3));
		
		adminService.removeQna(idx);
		adminService.addTempQna(reg);
		model.addAttribute("reg", reg);
		
		return "adminPage/qnaDeReg";
	}
	
	//미등록 삭제시
	@PostMapping("unregDelete")
	public String unregDelete(String unreg, String unreg_index, HttpServletRequest request, Model model) {
		log.info("미등록 카테고리 삭제 요청");
		int idx = Integer.parseInt(unreg_index.substring(5));
		String cateName = unreg.trim();
		
		adminService.removeTempQna(idx);
		adminService.removeQnaList(cateName);
		return "adminPage/qnaConfig";
	}
	
	//--------------------------------FAQ 카테고리------------------------------------------------------------------
	@RequestMapping("faqConfig")
	public String faqConfig(HttpServletRequest request, Model model) {
		log.info("faqConfig 페이지 호출");
		
		// 데이터 베이스에 저장된 등록 카테고리 데이터 가져오기
		List<FaqVO> cateList = adminService.getCateFaq();
		List<FaqTempVO> cateTempListFaq = adminService.getTempCateFaq();

		model.addAttribute("cateTempListFaq", cateTempListFaq);
		model.addAttribute("cateList", cateList);
		
		return "adminPage/faqConfig";
	}
	
	@RequestMapping("faqAdd")
	public String faqAdd() {
		return "adminPage/faqAdd";
	}
	
	@PostMapping("faqTempAdd")
	public String faqTempAdd(HttpServletRequest request, Model model) {
		//입력한 값 가져오기
		String categoryName = request.getParameter("catNameFaq");
		//추가버튼 클릭하여 새로운 미등록 카테고리 temp에 추가
		adminService.addTempFaq(categoryName);
		return "adminPage/qnaConfig";
	}
	
	
	@PostMapping("faqReg")
	public String faqReg(String unreg, String unreg_index, HttpServletRequest request, Model model) {
		log.info("faqReg 처리 요청");
		
		int idx = Integer.parseInt(unreg_index.substring(5));
		
		adminService.addFaq(unreg);
		adminService.removeTempFaq(idx);
		
		return "adminPage/faqConfig";
	}
	
	@PostMapping("faqDeReg")
	public String faqDeReg(String reg, String reg_index, Model model) {
		
		Integer idx = Integer.parseInt(reg_index.substring(3));
		
		adminService.removeFaq(idx);
		adminService.addTempFaq(reg);
		
		System.out.println("reg: " +reg);
		model.addAttribute("reg", reg);
		
		return "adminPage/faqDeReg";
	}
	
	@PostMapping("unregFaqDelete")
	public String unregFaqDelete(String unreg, String unreg_index, HttpServletRequest request, Model model) {
		log.info("미등록 카테고리 삭제 요청");
		int idx = Integer.parseInt(unreg_index.substring(5));
		String cateName = unreg.trim();
		
		adminService.removeTempFaq(idx);
		adminService.removeFaqList(cateName);
		
		return "adminPage/faqConfig";
	}
	
	//----------------------------------------------------------------------
	//QNABoard
	
	@GetMapping("/board/qnaList") 
	public void list(Model model) {
		// 보여줄 글 목록 가져와 view에 전달 
		model.addAttribute("list", boardService.getList());
		model.addAttribute("cate", adminService.getCate());
	}

	@GetMapping("/board/write")
	public void write(Model model) {
		System.out.println("write get요청!!!");
		model.addAttribute("cate", adminService.getCate());
	}
	
	@PostMapping("/board/write")
	public String writePro(BoardVO board, RedirectAttributes rttr) {
		// DB에 저장처리 
		boardService.register(board);
		log.info(board);
		// 리다이렉트할때 데이터 전송하는 방법중 하나로, 
		// 데이터를 일회성으로만 전달하고 싶을때 이 클래스의 ...Flash 메서 사용. 
		rttr.addFlashAttribute("result", board.getBoard_no());  
		
		return "redirect:/adminPage/board/qnaList"; 
	}


	@GetMapping({"/board/content","/board/modify","/board/delete"})
	public void content(@RequestParam("board_no") Long board_no, Model model) {
		model.addAttribute("board", boardService.get(board_no)); 
		model.addAttribute("cate", adminService.getCate());
	}
	
	@PostMapping("/board/modify") 
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		System.out.println(cri);
		boolean res = boardService.modify(board);
		System.out.println(res);
		
		if(res) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminPage/board/qnaList" + cri.getParameterLink(); 
	}
	@PostMapping("/board/delete")
	public String delete(@RequestParam("board_no") Long board_no, Criteria cri, RedirectAttributes rttr) {
		if(boardService.remove(board_no)) {
			rttr.addFlashAttribute("result", "success"); 
		}
		return "redirect:/adminPage/board/qnaList" ;
	}

	// 카테고리 검색
	@GetMapping("/board/categorySearch")
	public void categorySearch(BoardVO board, Model model) {
		model.addAttribute("list", boardService.categorySearch(board));
		model.addAttribute("cate", adminService.getCate());
	}
	
	
	//FAQBoard-----------------------------------------------------
	@Autowired
	private BoardFAQService faqBoardService; 
	
	@GetMapping("/faq/faqList") 
	public void faqList(Model model) {
		// 보여줄 글 목록 가져와 view에 전달 
		model.addAttribute("list", faqBoardService.getList());
		model.addAttribute("cate", adminService.getCateFaq());
		System.out.println("이걸?");
		
	}

	@GetMapping("/faq/write")
	public void faqWrite(Model model) {
		System.out.println("write get요청!!!");
		model.addAttribute("cate", adminService.getCateFaq());
	}
	
	@PostMapping("/faq/write")
	public String faqWritePro(FaqBoardVO board, RedirectAttributes rttr) {
		// DB에 저장처리 
		faqBoardService.register(board);
		log.info(board);
		// 리다이렉트할때 데이터 전송하는 방법중 하나로, 
		// 데이터를 일회성으로만 전달하고 싶을때 이 클래스의 ...Flash 메서 사용. 
		rttr.addFlashAttribute("result", board.getBoard_no());  
		
		return "redirect:/adminPage/faq/faqList"; 
	}


	@GetMapping({"/faq/content","/faq/modify","/faq/delete"})
	public void faqContent(@RequestParam("board_no") Long board_no, Model model) {
		model.addAttribute("board", faqBoardService.get(board_no)); 
		model.addAttribute("cate", adminService.getCate());
	}
	
	@PostMapping("/faq/modify") 
	public String faqModify(FaqBoardVO board, Criteria cri, RedirectAttributes rttr) {
		System.out.println(cri);
		boolean res = faqBoardService.modify(board);
		System.out.println(res);
		
		if(res) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminPage/faq/faqList" + cri.getParameterLink(); 
	}
	@PostMapping("/faq/delete")
	public String faqDelete(@RequestParam("board_no") Long board_no, Criteria cri, RedirectAttributes rttr) {
		if(faqBoardService.remove(board_no)) {
			rttr.addFlashAttribute("result", "success"); 
		}
		return "redirect:/adminPage/faq/faqList" ;
	}

	// 카테고리 검색
	@GetMapping("/faq/categorySearch")
	public void faqCategorySearch(FaqBoardVO board, Model model) {
		model.addAttribute("list", faqBoardService.categorySearch(board));
		model.addAttribute("cate", adminService.getCateFaq());
	}
}
