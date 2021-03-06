package com.qlbh.controller.danhmuc;

import java.io.IOException;
import java.util.List;

import com.jfoenix.controls.JFXButton;
import com.qlbh.controller.ManHinhChinhController;
import com.qlbh.controller.common.DialogConfirmController;
import com.qlbh.model.KhachhangHome;
import com.qlbh.pojo.Khachhang;

import javafx.beans.property.ReadOnlyObjectWrapper;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.image.Image;
import javafx.scene.input.MouseButton;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class KhachHangController {
	public static KhachHangController khachHangController = null;
	private Stage stageThemKhachHang = null, stageSuaKhachHang = null;
	@FXML
	private TableView<Khachhang> tableKhachHang;
	@FXML
	private JFXButton btnThemKhachHang, btnSua, btnXoa;
	/**
	 * Catch when FXML loaded
	 */
	@FXML
	protected void initialize() {
		KhachHangController.khachHangController = this;
		this.addRowEvents();
		this.setButtonControlsDisable(true);
		this.loadKhachHangToTable();
	}
	private void addRowEvents() {
		tableKhachHang.setRowFactory(tv -> {
		    TableRow<Khachhang> row = new TableRow<>();
		    row.setOnMouseClicked(event -> {
		    	// No row selected when click
		    	if ( row.isEmpty() ) {
		    		onTableKhachhangMouseClick();
		    	}
		    	// Double click
		    	else if ( ! row.isEmpty() && event.getButton() == MouseButton.PRIMARY && event.getClickCount() == 2 ) {
		    		Khachhang clickedRow = row.getItem();
		            onRowDoubleClick(clickedRow);
		        }
		    	// Single click
		    	else if ( ! row.isEmpty() && event.getButton() == MouseButton.PRIMARY ) {
		    		Khachhang clickedRow = row.getItem();
		        	onRowSingleClick(clickedRow);
		        }
		    });
		    return row;
		});
	}
	private void onRowDoubleClick(Khachhang kh) {
		this.setButtonControlsDisable(false);
	    this.onButtonSuaClick();
	}
	private void onRowSingleClick(Khachhang kh) {
	    this.setButtonControlsDisable(false);
	}
	
	private void onTableKhachhangMouseClick() {
		this.setButtonControlsDisable(true);
		// Clear row selection
		tableKhachHang.getSelectionModel().clearSelection();
	}
	void setButtonControlsDisable(Boolean disable) {
		btnSua.setDisable(disable);
		btnXoa.setDisable(disable);
	}
	public void closeManHinhThemKhachHang() {
		if ( this.stageThemKhachHang != null ) {
			this.stageThemKhachHang.close();
		}
	}
	public void closeManHinhSuaKhachHang() {
		if ( this.stageSuaKhachHang != null ) {
			this.stageSuaKhachHang.close();
		}
	}
	public void onKhachHangAdded() {
		this.refreshKhachHangTableData();
		this.closeManHinhThemKhachHang();
		this.tableKhachHang.requestFocus();
		this.tableKhachHang.getSelectionModel().selectLast();
		this.setButtonControlsDisable(false);
	}
	public void onKhachHangUpdated() {
		Integer index = this.tableKhachHang.getSelectionModel().getSelectedIndex();
		this.refreshKhachHangTableData();
		this.closeManHinhSuaKhachHang();
		this.tableKhachHang.requestFocus();
		this.tableKhachHang.getSelectionModel().select(index);
	}
	
	@FXML
	void btnThemKhachHangClick(ActionEvent event) {
		Stage primaryStage = new Stage();
		Parent root;
		try {
			root = FXMLLoader.load(getClass().getResource("../../fxml/danhmuc/ThemKhachHang.fxml"));
			Scene scene = new Scene(root);
			primaryStage.setTitle("Th??m kh??ch h??ng");
			primaryStage.initStyle(StageStyle.UNIFIED);
			primaryStage.initModality(Modality.APPLICATION_MODAL);
			primaryStage.setResizable(false);
			primaryStage.setScene(scene);
			primaryStage.getIcons().add(new Image(getClass().getResourceAsStream("../../images/appIcon.png")));
			primaryStage.show();
			this.stageThemKhachHang = primaryStage;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Khachhang getSelectedKhachhang() {
		return this.tableKhachHang.getSelectionModel().getSelectedItem();
	}
	@FXML
	void onButtonSuaClick() {
		Stage primaryStage = new Stage();
		Parent root;
		try {
			FXMLLoader loader = new FXMLLoader(getClass().getResource("../../fxml/danhmuc/SuaKhachHang.fxml"));
			root = loader.load();
			Scene scene = new Scene(root);
			SuaKhachHangController controller = 
				    loader.<SuaKhachHangController>getController();
			controller.setKhachhang(this.getSelectedKhachhang());
			primaryStage.setTitle("S???a Kh??ch h??ng");
			primaryStage.initStyle(StageStyle.UNIFIED);
			primaryStage.initModality(Modality.APPLICATION_MODAL);
			primaryStage.setResizable(false);
			primaryStage.setScene(scene);
			primaryStage.getIcons().add(new Image(getClass().getResourceAsStream("../../images/appIcon.png")));
			primaryStage.show();
			this.stageSuaKhachHang = primaryStage;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@FXML
	void onButtonXoaClick() {
		DialogConfirmController.show(
				"X??a kh??ch h??ng?",
				"B???n c?? ch???c mu???n x??a kh??ch h??ng n??y",
				()-> this.deleteKhachHang(),
				null);
	}
	@FXML
	void onButtonExitClick() {
		ManHinhChinhController.tabKhachHang.getTabPane().getTabs().remove(ManHinhChinhController.tabKhachHang);
		ManHinhChinhController.tabKhachHang = null;
	}
	@FXML
	void onButtonRefreshClick() {
		this.refreshKhachHangTableData();
		this.setButtonControlsDisable(true);
	}
	public void refreshKhachHangTableData() {
		this.tableKhachHang.setItems(this.getDSKhachHang());
	}
	private void deleteKhachHang() {
		Khachhang khachHang = this.tableKhachHang.getSelectionModel().getSelectedItem();
		if ( khachHang == null ) {
			return;
		}
		KhachhangHome khachHangHome = new KhachhangHome();
		khachHangHome.delete(khachHang);
		this.refreshKhachHangTableData();
		this.setButtonControlsDisable(true);
	}
	/**
	 * Get data for table KhachHang
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private ObservableList<Khachhang> getDSKhachHang() {
		KhachhangHome khachhangHome = new KhachhangHome();
		List<Khachhang> khachHangs = khachhangHome.findAll();
		ObservableList<Khachhang> oListKhachHang = FXCollections.observableList(khachHangs);
		return oListKhachHang;
	}
	/**
	 * Load list KhachHang to tableView
	 */
	@SuppressWarnings("unchecked")
	void loadKhachHangToTable() {
		// Create column for table KhachHang
		TableColumn<Khachhang, Number> colSTT = new TableColumn<Khachhang, Number>("#");
		colSTT.setSortable(false);
		colSTT.setCellValueFactory(column-> new ReadOnlyObjectWrapper<Number>(tableKhachHang.getItems().indexOf(column.getValue()) + 1));
		
		TableColumn<Khachhang, String> colMaKhachHang = new TableColumn<Khachhang, String>("M??");
		colMaKhachHang.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getMa()));
		
		TableColumn<Khachhang, String> colTenKhachHang = new TableColumn<Khachhang, String>("T??n");
		colTenKhachHang.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getTen()));
		
		TableColumn<Khachhang, String> colNguoiLienHe = new TableColumn<Khachhang, String>("Ng?????i li??n h???");
		colNguoiLienHe.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getNguoilienhe()));
		
		TableColumn<Khachhang, String> colDiaChi = new TableColumn<Khachhang, String>("?????a ch???");
		colDiaChi.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getDiachi()));
		
		TableColumn<Khachhang, String> colDienThoai = new TableColumn<Khachhang, String>("??i???n tho???i");
		colDienThoai.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getDienthoai()));
		
		TableColumn<Khachhang, String> colEmail = new TableColumn<Khachhang, String>("Email");
		colEmail.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getEmail()));
		
		TableColumn<Khachhang, String> colMaSoThue = new TableColumn<Khachhang, String>("M?? s??? thu???");
		colMaSoThue.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getMasothue()));
		
		TableColumn<Khachhang, String> colSoTaiKhoan = new TableColumn<Khachhang, String>("S??? t??i kho???n");
		colSoTaiKhoan.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getTaikhoan()));
		
		TableColumn<Khachhang, String> colTenNganHang = new TableColumn<Khachhang, String>("T??n ng??n h??ng");
		colTenNganHang.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().getNganhang()));
		
		tableKhachHang.setItems(this.getDSKhachHang());
		tableKhachHang.getColumns().addAll(colSTT, colMaKhachHang, colTenKhachHang, colNguoiLienHe,
				colDiaChi, colDienThoai, colEmail, colMaSoThue, colSoTaiKhoan, colTenNganHang);
	}
}
