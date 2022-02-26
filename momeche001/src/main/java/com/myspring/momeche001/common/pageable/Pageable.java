package com.myspring.momeche001.common.pageable;

public class Pageable {

	int totalCount; //�� ������ ����
	int countPage; //����¡ ����
	int page; //���� ������
	int countList; //�� ������ ������ ����
	int totalPage; //�� ������ ����
	int startPage; //������ ���� ��ȣ
	int endPage; //������ �� ��ȣ

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCountList() {
		return countList;
	}

	public void setCountList(int countList) {
		this.countList = countList;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void Paging() throws Exception{
        
        if(page == 0) {
        	setPage(1);
        }
        
        if(countList ==0) {
        	setCountList(10);
        }
        
        if(countPage == 0) {
        	setCountPage(10);
        }
        
        //pagination
        this.totalPage = totalCount / countList;
        
        if (totalCount % countList > 0) {
        	totalPage++;
        }
        
        if (totalPage < page) {
        	page=totalPage;
        }
        
        this.startPage = ((page - 1) / countPage) * countPage + 1;
        this.endPage = startPage + countPage - 1;
        
        if (endPage > totalPage) {
        	endPage = totalPage;
        }
       
	}

	
	
	
}
