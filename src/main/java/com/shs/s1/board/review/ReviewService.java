package com.shs.s1.board.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shs.s1.util.FileManager;
import com.shs.s1.board.BoardDTO;
import com.shs.s1.board.BoardService;
import com.shs.s1.board.ReviewFileDTO;
import com.shs.s1.util.BoardPager;

@Service
public class ReviewService implements BoardService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private HttpSession session;

	public long getNum() throws Exception {
		long getNum = reviewDAO.getNum();

		return getNum;
	}

	public long totalCount(BoardPager boardPager) throws Exception {
		long totalCount = reviewDAO.getTotalCount(boardPager);

		return totalCount;
	}

	@Override
	public List<BoardDTO> getList(BoardPager boardPager) throws Exception {

		// startRow, lastRow 만드는 메서드
		boardPager.makeRow();

		// totalCount 구하기
		long totalCount = reviewDAO.getTotalCount(boardPager);

		// 페이징 계산
		boardPager.makeNum(totalCount);

		System.out.println(boardPager);

		return reviewDAO.getList(boardPager);
	}

	@Override
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		// hit
		int result = reviewDAO.setHitUpdate(boardDTO);
		return reviewDAO.getSelect(boardDTO);
	}

	public int setInsert(BoardDTO boardDTO, MultipartFile[] files) throws Exception {

		// 글 번호 찾기

		long num = reviewDAO.getNum();

		boardDTO.setNum(num);

		int result = reviewDAO.setInsert(boardDTO);

		for (MultipartFile mf : files) {

			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			String fileName = fileManager.save("review", mf, session);

			reviewFileDTO.setNum(num);
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setOrigineName(mf.getOriginalFilename());

			reviewDAO.setFileInsert(reviewFileDTO);
		}

		return result;
	}

	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files) throws Exception {

		for (MultipartFile multipartFile : files) {
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			// 1. File들을 HDD에 저장
			String fileName = fileManager.save("review", multipartFile, session);
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setOrigineName(multipartFile.getOriginalFilename());
			reviewFileDTO.setNum(boardDTO.getNum());
			// 2. DB에 Insert
			reviewDAO.setFileInsert(reviewFileDTO);
		}

		return reviewDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelect(BoardDTO boardDTO) throws Exception {
		return reviewDAO.setDelete(boardDTO);
	}

	public int setFileDelete(ReviewFileDTO reviewFileDTO) throws Exception {

		// fileName을 console에 print
		// 1. 조회
		reviewFileDTO = reviewDAO.getFileSelect(reviewFileDTO);
		System.out.println(reviewFileDTO.getFileName());

		// 2. table 삭제
		int result = reviewDAO.setFileDelete(reviewFileDTO);

		// 3. HDD 삭제
		if (result > 0) {
			fileManager.delete("review", reviewFileDTO.getFileName(), session);
		}
		return result;
	}

	public String setSummerFileUpload(MultipartFile file) throws Exception {
		// 첨부파일x
		String fileName = fileManager.save("review", file, session);
		return fileName;

	}

	public Boolean setSummerFileDelete(String fileName) throws Exception {
		// 폴더명, 파일명
		boolean result = fileManager.delete("review", fileName, session);
		return result;
	}

}
