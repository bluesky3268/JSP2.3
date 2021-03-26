package guestbook.service;

import java.util.List;

import guestbook.model.Message;

public class MessageListView {
	
	private int messageTotalCount; // 메시지 전체 개수
	private int currentPageNumber; // 현재 페이지
	private List<Message> messageList; // 메시지 목록
	private int pageTotalCount; // 전체 페이지 수
	private int messageCountPerPage; // 페이지 당 메시지 출력 개수
	private int firstRow; // 현재 메시지 목록의 시작행
	private int endRow; // 현재 메시지 목록의 끝행
	
	public MessageListView(List<Message> messageList, int messageTotalCount, int currentPageNumber, int messageCountPerPage, int firstRow, int endRow) {
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if(messageTotalCount == 0) {
			pageTotalCount = 0;
		}else {
			// 전체 페이지 수 = 전체 메시지 수 / 페이지당 메시지 출력 개수 (예_ 1000개의 게시글 / 10(1페이지에 10개) = 100페이지)
			// 만약 134 / 10 = 13.4 -> 14페이지가 되어야 함.
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if(messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<Message> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
	
}
