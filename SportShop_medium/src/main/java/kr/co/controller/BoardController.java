package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.service.BoardService;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private BoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	/*
	 * 글 등록 폼: board/create, get 방식 글 등록 db: board/create, post 글 목록:
	 * board/listAll 특정글 보기 : board/read?bno=xxx 글 수정 폼: board/update?bno=xxx,
	 * get 방식 글 수정 db: board/update, post 방식 글 삭제 : board/delete, post 이거는 특정글
	 * 보기에서 글삭제를 할것임........
	 */
	
	
	@ResponseBody
	@RequestMapping("/getAttach/{bno}")
	public List<String> getAttach(@PathVariable("bno") int bno) throws Exception{
		System.out.println("::::::::::::::::::::::::::");
		List<String> attchList= service.getAttach(bno);
		System.out.println(attchList);
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&");
	
		//@ResponseBody  :  json 형태로 반환한다는 의미임......		
		return service.getAttach(bno);
	}
	
	
	

	// 입력폼으로 넘어간느거..
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public void createGet(@ModelAttribute("cri") Criteria cri) throws Exception {

		System.out.println("입력 화면으로 넘어감.");
		System.out.println("path : board/create.jsp");

		/*
		 * model.addAttribute("page", cri.getPage());
		 * model.addAttribute("perPageNum", cri.getPerPageNum());
		 */

	}

	// 실제 db작업
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String createPost(BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {

		
	//	String title="title"; String content="content";
	

	
		long start=System.currentTimeMillis();

	//	for (int i = 0; i < 1000; i++) {
		int bno = service.getBno();
		vo.setBno(bno);
	//	 vo.setTitle(title+i);
	//	 vo.setContent(content+i);
		// board 객체에 set해주기.............. bno값...... 에러 안나기 위해서......
	
		service.create(vo);

	//	Thread.sleep(50);

	//	}

		rttr.addFlashAttribute("msg", "INSERT_SUCCESS");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("orderType", cri.getOrderType());

		/* redirect를 할꺼임. */
		/*
		 * redirect 하면서 성공했다는 msg를 줄거임......... 근데 실행하면 에러가 날꺼임. 이유는 create에서
		 * bno를 하지 않고 컨트롤러에서 bno를 하기로 했기 때문에,,
		 * 
		 * bno 넣어주기 작업...... int bno=service.getBno(); vo.setBno(bno);
		 */
		/* 작업이 완료되면 스크립트 나오게. */

		/*
		 * "redirect:/board/read?bno="+bno"; 이렇게 해도 되긴함.......
		 * 
		 */

		rttr.addAttribute("bno", bno);
		
		
		long end=System.currentTimeMillis();
		
		
		System.out.println("시간: " + (end-start));
		System.out.println("==============================");

		return "redirect:/board/read";
	}

	@RequestMapping(value = "listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		List<BoardVO> list = service.listAll();

		model.addAttribute("list", list);

		System.out.println("/board/listAll");
		System.out.println("board/listAll.jsp");

	}

	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		BoardVO vo = service.read(bno);
		/*List<String> =service.getAttach(bno);*/
		//service.addViewCnt(bno);
		model.addAttribute("vo", vo);
		System.out.println("board/read.jsp");

	}

	/* update의 내용을 뿌려주는거 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void updateGet(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		BoardVO vo = service.read(bno);
		model.addAttribute("vo", vo);
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updatePost(BoardVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
		/* 작업이 끝나고 난다음에, listAll로 갈것임. */

		service.update(vo);
		
		//service.deleteAttach();
		rttr.addAttribute("msg", "UPDATE_SUCCESS");
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("orderType", cri.getOrderType());

		return "redirect:/board/listCriteria";

	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("bno") int bno, Criteria cri,
			/* Model model */ RedirectAttributes rttr) throws Exception {

		/*
		 * ModelAttribute
		 * 
		 */
		// @RequestParam("bno") 이거 안써도 되긴함.......
		
		System.out.println("+++++++++");
		
		List<String> list = service.getAttach(bno);

		service.delete(bno);
		
		if(list != null){
			for(String fileName: list){
				String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
				
				MediaType mType= MediaUtils.getMediaType(formatName);
				
				if(mType !=null){	//이미지 파일이면
					String prefix= fileName.substring(0, 12);
					String suffix= fileName.substring(14);
					
					System.out.println(prefix);
					System.out.println(suffix);
					
					System.out.println("================================");
					System.out.println(fileName);
					
					/*원본 파일 지우는거*/
					File f = new File(uploadPath+(prefix+suffix).replace('/', File.separatorChar));
					
					/*이번에는 거꾸로*/			
				//	C:\zzz/upload/2017/05/30/f45c8c72-5398-4fac-aa44-3d025e4c3d32_yoshi.jpg
					f.delete();
				}
				
				
				/*썸네일 지우는거*/
				new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
			}
		}

		System.out.println(cri.getPage());
		System.out.println(cri.getPerPageNum());
		rttr.addAttribute("msg", "DELETE_SUCCESS");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("orderType", cri.getOrderType());

		return "redirect:/board/listCriteria";
	}

	@RequestMapping(value = "listCriteria", method = RequestMethod.GET)
	public void listCriteria(@ModelAttribute("cri") Criteria cri, Model model
			) throws Exception {
		
		System.out.println("++++++++++++++++++++");
		System.out.println(cri);
		List<BoardVO> list = service.listCriteria(cri, cri.getOrderType());

		model.addAttribute("list", list);

		/*
		 * =====================================================================
		 * ======== 추가 내용........ pageMaker *
		 */
		
		/*여기서 넘어온순간 perPageNum을 가져옴..
		 * 
		 * */
		
		
		
		
		int totalCount = service.totalCount();
		PageMaker pageMaker = new PageMaker();
	
		pageMaker.setCri(cri);
		//pageMaker.setCri(cri);
		//pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		model.addAttribute("pageMaker", pageMaker);
		// if(p)
		
		//if(){		
	/*	int totalPage = pageMaker.getTotalPage();
		totalCount =pageMaker.getTotalCount();
		
		int ppage = totalCount/totalPage;
		
		if(ppage> pageMaker.getTotalPage()){
			ppage = pageMaker.getEndPageNum();
		}
		
		cri.setPage(ppage);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);*/
		//}
	

	}
	
	@RequestMapping(value = "blistCriteria", method = RequestMethod.GET)
	public String blistCriteria(Criteria cri, RedirectAttributes rttr) throws Exception {
		
		System.out.println(cri);

		int totalCount = service.totalCount();
		PageMaker pageMaker = new PageMaker();

		System.out.println(totalCount);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		rttr.addAttribute("page", pageMaker.getCri().getPage());
		rttr.addAttribute("perPageNum", pageMaker.getCri().getPerPageNum());
		rttr.addAttribute("orderType", cri.getOrderType());

		return "redirect:/board/listCriteria";
	}
	
	
/*	@RequestMapping(value = "listCriteria2", method = RequestMethod.GET)
	public String listCriteria2(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		List<BoardVO> list = service.listCriteria(cri);
		model.addAttribute("list", list);

		
		 * =====================================================================
		 * ======== 추가 내용........ pageMaker *
		 
		
		여기서 넘어온순간 perPageNum을 가져옴..
		 * 
		 * 
		
		
		int totalCount = service.totalCount();
		PageMaker pageMaker = new PageMaker();

	
		System.out.println("+++++++");
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		
		
		//int perPageNum = cri.getPerPageNum();
		//int ppage = cri.getPage();
		
		
		int totalPage = pageMaker.getTotalPage();
		totalCount =pageMaker.getTotalCount();
		
		int ppage = totalCount/totalPage;
		
		if(ppage> totalPage){
			ppage = totalPage;
		}
		
	//	cri.setPage(ppage);		
		
		//int totalPage =pageMaker.getTotalPage();
		//Integer ppage = totalCount/totalPage;
		
		//System.out.println(ppage);
		
		if(ppage == null){
			
			if(ppage> totalPage){
				ppage = totalPage;
			}			
		}else{
			ppage = 1;
		}
		
		
		//cri.setPage(ppage);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		//int page = pageMaker.getCri().getPage();
		
		
		
		//totalCount=pageMaker.getTotalCount();
		
		여기서 이제 총페이지 수를 알수 있음.
		 *  
		 * 
		
		총페이지수를 구하기위해서는 총 리스트에에서 perPageNum으로 나눈값임
		 * totalCount/perPageNum으로
		 * 
		 * 총페이지수가 일단 변하네......
		 * 여기서...
		 * 그럼 총페이지수를 구했어..
		 * 
		
		
		//cri.setPerPageNum(perPageNum);
		
		
		//pageMaker.setCri(cri);
	//	pageMaker.setTotalCount(totalCount);

		model.addAttribute("pageMaker", pageMaker);
		return "redirect:/board.listCriteria?page=${ppage}&perPageNum=${pageMaker.cri.perPageNum}";

	}*/
	
	

	
	/*befroe read : read 들어가기전에 실행하겠다 의미*/
	@RequestMapping("bread")
	public String newRead(HttpServletRequest request, HttpServletResponse response, int bno,
			Criteria cri, RedirectAttributes rttr
			) throws Exception {
		//, int bno parameter 추가
		/* 지금은 쿠키를 배운다고 생각해라 */
		// 조금있다가 조회수 조작은 여기서 하기는 하지만

		/* 클라이언트에 있는 쿠키를 서버로 가져와야됨 request
		 * 
		 * 쿠키 200개정도 저장된다고 함....
		 */
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;		//하나짜리 쿠키

		/* 쿠키가 들어있을때만 */
		if (cookies != null && cookies.length > 0) {
			System.out.println("배열쿠키가 있음.");

			/* 쿠키배열있는거하고 내가 컨트롤하는거를 확인해야됨. */
			for (int i = 0; i < cookies.length; i++) {
				/* 이름이 키임 쿠키의이름이 ck */
				if (cookies[i].getName().equals("ck")) {
					cookie = cookies[i];
				}
			}
		}
		
		/*cookies 배열안에 ck가 없다는말임
		 * 그럼 처음으로 만들어줘야된다는 말임.
		 * */
		if(cookie == null){
			// new Cookie("키", "|hello|"); 값은 구분자를 넣어서 들어감... 구분자는 #이던 상관없음.. %이던..
			/*cookie = new Cookie("ck", "|hello|");*/
			cookie = new Cookie("ck", "|"+bno+"|");
			
			/*서버에서 클라이언트에게 넘겨줘야되니까 response를 써줌*/
			response.addCookie(cookie);
			
			
			/*지금 이상황은 한번도 조회를 안한 상태이기 때문에 해당 조회수를 올려줘야됨.*/
			service.addViewCnt(bno);
			
			
		}else{
			/*ck라는 이름이 이미 존재할수 도 있는경우*/
			String value=cookie.getValue();
			if(value.indexOf("|"+bno+"|")<0){
				/*쿠키가 있는 상태인데, 다른 번호의 쿠키가 없는거임. 그런상황
				 * |1||2||3|
				 * 
				 *  if문 안쪽은
				 *  
				 *  여기서 addViewCnt 쿠키가 존재하긴 한데, 다른 번호 이기 때문에
				 * */			
				
				service.addViewCnt(bno);
				
				
				/*없다는 애기임 예를들어 320번인거를 쿠키에 저장해준적이 없다는 말이 
				 * 그래서 저장해준다..
				 * */				
				value=value+"|"+bno+"|";
				
				cookie.setValue(value);
				//바뀐 값을 넣어준다........예전에는 장바구니 이런거 쿠키에다가 했었는데, 지금은 db씀.......
				response.addCookie(cookie);
			}				
		}
		
		System.out.println("1111111111111");
		System.out.println("cri : " + cri);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("orderType", cri.getOrderType());
		rttr.addAttribute("bno", bno);


		return "redirect:/board/read";

	}

	/*
	 * @RequestMapping(value="right", method=RequestMethod.GET) public String
	 * listRightCriteria(Criteria cri, Model model) throws Exception{
	 * List<BoardVO> list = service.listCriteria(cri);
	 * model.addAttribute("list", list);
	 * 
	 * 
	 * int totalCount =service.totalCount(); PageMaker pageMaker = new
	 * PageMaker();
	 * 
	 * cri.setPage(cri.getPage()+1); System.out.println(cri.getPage());
	 * System.out.println(cri.getEndRow());
	 * 
	 * if(cri.getPage()>pageMaker.getTotalCount()){
	 * cri.setPage(cri.getEndRow()); } pageMaker.setCri(cri);
	 * pageMaker.setTotalCount(totalCount);
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "/board/listCriteria";
	 * 
	 * }
	 * 
	 * @RequestMapping(value="left", method=RequestMethod.GET) public String
	 * listLeftCriteria(Criteria cri, Model model) throws Exception{
	 * List<BoardVO> list = service.listCriteria(cri);
	 * model.addAttribute("list", list);
	 * 
	 * 
	 * int totalCount =service.totalCount(); PageMaker pageMaker = new
	 * PageMaker();
	 * 
	 * //if(cri.getPage()) cri.setPage(cri.getPage()-1);
	 * 
	 * if(cri.getPage()<1){ cri.setPage(1); } pageMaker.setCri(cri);
	 * pageMaker.setTotalCount(totalCount);
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "/board/listCriteria";
	 * 
	 * }
	 */
	
	
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int bno) throws Exception{
		
		service.deleteAttach(fileName, bno);
		
	/*	String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType= MediaUtils.getMediaType(formatName);
		
		if(mType !=null){	//이미지 파일이면
			String prefix= fileName.substring(0, 12);
			String suffix= fileName.substring(14);
			
			System.out.println(prefix);
			System.out.println(suffix);
			
			System.out.println("================================");
			System.out.println(fileName);
			
			원본 파일 지우는거
			File f = new File(uploadPath+(prefix+suffix).replace('/', File.separatorChar));
			
			이번에는 거꾸로			
		//	C:\zzz/upload/2017/05/30/f45c8c72-5398-4fac-aa44-3d025e4c3d32_yoshi.jpg
			f.delete();
		}
		
		
		썸네일 지우는거
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();*/
		
		
		System.out.println("++++++++");
		System.out.println("fileName : "+fileName);	
		
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
		
	}

}
