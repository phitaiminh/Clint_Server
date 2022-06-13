package com.qlbh.pojo;
// Generated 26/10/2016 3:07:02 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Chitietphieuxuat generated by hbm2java
 */
@Entity
@Table(name="chitietphieuxuat"
    ,catalog="qlbh"
)
public class Chitietphieuxuat  implements java.io.Serializable {


     private Integer id;
     private Hanghoa hanghoa;
     private Phieuxuat phieuxuat;
     private String ma;
     private Integer soluong;
     private Double dongia;
     private Double thanhtien;
     private Boolean activity;

    public Chitietphieuxuat() {
    }

    public Chitietphieuxuat(Hanghoa hanghoa, Phieuxuat phieuxuat, String ma, Integer soluong, Double dongia, Double thanhtien, Boolean activity) {
       this.hanghoa = hanghoa;
       this.phieuxuat = phieuxuat;
       this.ma = ma;
       this.soluong = soluong;
       this.dongia = dongia;
       this.thanhtien = thanhtien;
       this.activity = activity;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="hanghoaid")
    public Hanghoa getHanghoa() {
        return this.hanghoa;
    }
    
    public void setHanghoa(Hanghoa hanghoa) {
        this.hanghoa = hanghoa;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="phieuxuatid")
    public Phieuxuat getPhieuxuat() {
        return this.phieuxuat;
    }
    
    public void setPhieuxuat(Phieuxuat phieuxuat) {
        this.phieuxuat = phieuxuat;
    }

    
    @Column(name="ma", length=20)
    public String getMa() {
        return this.ma;
    }
    
    public void setMa(String ma) {
        this.ma = ma;
    }

    
    @Column(name="soluong")
    public Integer getSoluong() {
        return this.soluong;
    }
    
    public void setSoluong(Integer soluong) {
        this.soluong = soluong;
    }

    
    @Column(name="dongia", precision=22, scale=0)
    public Double getDongia() {
        return this.dongia;
    }
    
    public void setDongia(Double dongia) {
        this.dongia = dongia;
    }

    
    @Column(name="thanhtien", precision=22, scale=0)
    public Double getThanhtien() {
        return this.thanhtien;
    }
    
    public void setThanhtien(Double thanhtien) {
        this.thanhtien = thanhtien;
    }

    
    @Column(name="activity")
    public Boolean getActivity() {
        return this.activity;
    }
    
    public void setActivity(Boolean activity) {
        this.activity = activity;
    }




}

