package com.qlbh.controller.danhmuc;

import org.apache.log4j.Logger;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import com.qlbh.model.DonvitinhHome;
import com.qlbh.pojo.Donvitinh;

import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class ThemDonViTinhController {

	@FXML
	private JFXButton btnSave, btnCancel;

	@FXML
	private Label lbValidate;

	@FXML
	private JFXTextField txtMa, txtTen, txtGhiChu;

	final static Logger logger = Logger.getLogger(ThemDonViTinhController.class);

	@FXML
	void btnSaveClick() {
		if (txtMa.getLength() == 0 || txtTen.getLength() == 0) {
			lbValidate.setText("Vui lòng nhập Mã và Tên");
			return;
		}
		Donvitinh dvt = new Donvitinh();
		dvt.setMa(txtMa.getText());
		dvt.setTen(txtTen.getText());
		dvt.setGhichu(txtGhiChu.getText());
		dvt.setActivity(true);
		DonvitinhHome dvth = new DonvitinhHome();
		try {
			dvth.save(dvt);
			txtMa.clear();
			txtTen.clear();
			txtGhiChu.clear();
			lbValidate.setText("");
			QuanLyDonViTinhController.quanLyDonViTinhController.reload();
		} catch (Exception ex) {
			logger.error("This is error : " + ex.getMessage());
		}

	}

	@FXML
	void btnCancelClick() {
		QuanLyDonViTinhController.quanLyDonViTinhController.closeThem();
	}

}
