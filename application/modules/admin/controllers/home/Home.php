<?php

/*
 * @Author:    Kiril Kirkov
 *  Gitgub:    https://github.com/kirilkirkov
 */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Home extends ADMIN_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('Orders_model', 'History_model'));
    }

    public function index()
    {
        $this->login_check();
        $data = array();
        $head = array();
        $head['title'] = 'Administration - Home';
        $head['description'] = '';
        $head['keywords'] = '';
        $data['newOrdersCount'] = $this->Orders_model->ordersCount(true);
        $data['lowQuantity'] = $this->Home_admin_model->countLowQuantityProducts();
        $data['lastSubscribed'] = $this->Home_admin_model->lastSubscribedEmailsCount();
        $data['activity'] = $this->History_model->getHistory(10, 0);
        $data['mostSold'] = $this->Home_admin_model->getMostSoldProducts();
        $data['byReferral'] = $this->Home_admin_model->getReferralOrders();
        $data['ordersByPaymentType'] = $this->Home_admin_model->getOrdersByPaymentType();
        $data['ordersByMonth'] = $this->Home_admin_model->getOrdersByMonth();
        $this->load->view('_parts/header', $head);
        $this->load->view('home/home', $data);
        $this->load->view('_parts/footer');
        $this->saveHistory('Go to home page');
    }

    /*
     * Called from ajax
     */

    public function changePass()
    {
        $this->login_check();
        $result = $this->Home_admin_model->changePass($_POST['new_pass'], $this->username);
        if ($result == true) {
            echo 1;
        } else {
            echo 0;
        }
        $this->saveHistory('Password change for user: ' . $this->username);
    }

    public function logout()
    {
        $this->session->sess_destroy();
        redirect('admin');
    }

    public function laporanExcel(){

        require(APPPATH. 'PHPExcel-1.8/Classes/PHPExcel.php');
        require(APPPATH . 'PHPExcel-1.8/Classes/PHPExcel/Writer/Excel2007.php');

        $object = new PHPExcel();

        $object->getProperties()->setCreator("Abimanyu BP");
        $object->getProperties()->setLastModifiedBy("Abimanyu BP");
        $object->getProperties()->setTitle("Penjualan Produk");

        $object->setActiveSheetIndex(0);

        $object->getActiveSheet()->setCellValue('A1', 'NO');
        $object->getActiveSheet()->setCellValue('B1', 'Produk');
        $object->getActiveSheet()->setCellValue('C1', 'Harga');
        $object->getActiveSheet()->setCellValue('D1', 'Jumlah');
        $object->getActiveSheet()->setCellValue('E1', 'Total');

        $object->getActiveSheet()->setCellValue('A2', 1);
        $object->getActiveSheet()->setCellValue('B2', 'Donut Coklat');
        $object->getActiveSheet()->setCellValue('C2', '10000');
        $object->getActiveSheet()->setCellValue('D2', '5');
        $object->getActiveSheet()->setCellValue('E2', '50000');

        $object->getActiveSheet()->setCellValue('A3', 2);
        $object->getActiveSheet()->setCellValue('B3', 'Donut Coklat Vanila Frosting');
        $object->getActiveSheet()->setCellValue('C3', '15000');
        $object->getActiveSheet()->setCellValue('D3', '3');
        $object->getActiveSheet()->setCellValue('E3', '45000');

        $object->getActiveSheet()->setCellValue('A4', 3);
        $object->getActiveSheet()->setCellValue('B4', 'Moccacino');
        $object->getActiveSheet()->setCellValue('C4', '14000');
        $object->getActiveSheet()->setCellValue('D4', '0');
        $object->getActiveSheet()->setCellValue('E4', '0');

        $filename = "Data Penjualan Produk Foodie Goodie" . '.xlsx';

        $object->getActiveSheet()->setTitle("Data Penjualan Produk");

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');

        $writer=PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        ob_end_clean();
        $writer->save('php://output');

        exit;
    }

}
