package com.pofol.shop.domain;

import java.util.Date;
import java.util.Objects;

public class CommentDto
{

    public CommentDto()
    {
    }

    public CommentDto(Integer bno, Integer pcno, String comment, String commenter)
    {
        this.bno = bno;
        this.pcno = pcno;
        this.comment = comment;
        this.commenter = commenter;
    }

    public Integer getCno()
    {
        return cno;
    }

    public void setCno(Integer cno)
    {
        this.cno = cno;
    }

    public Integer getBno()
    {
        return bno;
    }

    public void setBno(Integer bno)
    {
        this.bno = bno;
    }

    public Integer getPcno()
    {
        return pcno;
    }

    public void setPcno(Integer pcno)
    {
        this.pcno = pcno;
    }

    public String getComment()
    {
        return comment;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public String getCommenter()
    {
        return commenter;
    }

    public void setCommenter(String commenter)
    {
        this.commenter = commenter;
    }

    public Date getReg_date()
    {
        return reg_date;
    }

    public void setReg_date(Date reg_date)
    {
        this.reg_date = reg_date;
    }

    public Date getUp_date()
    {
        return up_date;
    }

    public void setUp_date(Date up_date)
    {
        this.up_date = up_date;
    }

    public String toString()
    {
        return (new StringBuilder("CommentDto [cno=")).append(cno).append(", bno=").append(bno).append(", pcno=").append(pcno).append(", comment=").append(comment).append(", commenter=").append(commenter).append(", reg_date=").append(reg_date).append(", up_date=").append(up_date).append("]").toString();
    }

    public int hashCode()
    {
        return Objects.hash(new Object[] {
            bno, cno, comment, commenter, pcno
        });
    }

    public boolean equals(Object obj)
    {
        if(this == obj)
            return true;
        if(obj == null)
            return false;
        if(getClass() != obj.getClass())
            return false;
        CommentDto other = (CommentDto)obj;
        return Objects.equals(bno, other.bno) && Objects.equals(cno, other.cno) && Objects.equals(comment, other.comment) && Objects.equals(commenter, other.commenter) && Objects.equals(pcno, other.pcno);
    }

    private Integer cno;
    private Integer bno;
    private Integer pcno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private Date up_date;
}
