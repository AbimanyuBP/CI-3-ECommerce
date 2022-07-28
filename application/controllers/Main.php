<?php 

class Main extends CI_Controller {
    var $yeet = "";

    public function __construct()
    {
        //panggil model
        // $this->load->model('barang_model');
        // $this->model = $this->barang_model;
    }

    public function index()
    {
        //load view dahboard/overview.php
        // $this->model->get_rows(); //ambil database data
        // $barang = $this->model->countBarang();
        // $device = $this->model->countDevice();
        // $on = $this->model->countOn();
        // $off = $this->model->countOff();
        // $data = array('model' => $this->model, 'barang' => $barang, 'device' => $device,
        // 'on' => $on, 'off' => $off); //hasil semua query load ke array
        $this->load->view("dahboard/dash_view"); //pass ke data ke view lewat var $data
    }

    public function tambah()
    {
        if (isset($_POST['btnSubmit'])) {
            $this->model->nama = $_POST['nama'];
            $this->model->is_device = $_POST['device'];
            $this->model->kondisi = $_POST['kondisi'];
            $this->model->jumlah = $_POST['jumlah'];
            $this->model->insert();
            redirect('admin');
        } else {
            $this->load->view('dahboard/dash_add_view', ['model' => $this->model]);
        }
    }

    public function edit()
    {
        $kode = $this->uri->segment(4);
        $this->model->get_row($kode);
        
        $this->load->view('dahboard/dash_edit_view', ['model' => $this->model]);
        
    }

    public function ubah()
    {

        $this->model->id = $this->input->post('id');
        $this->model->nama = $this->input->post('nama');
        $this->model->is_device = $this->input->post('device');
        $this->model->kondisi = $this->input->post('kondisi');
        $this->model->jumlah = $this->input->post('jumlah');

        $this->model->update();
        
        redirect('admin');
        
    }

    public function hapus()
    {
        $kode = $this->uri->segment(4);
        $this->model->delete($kode);
        
        redirect('admin');
        
    }

    public function exportpdf()
    {
        require(APPPATH . '/third_party/fpdf/fpdf.php');

        $pdf = new FPDF('l','mm','A5');
        // membuat halaman baru
        $pdf->AddPage();
        // setting jenis font yang akan digunakan
        $pdf->SetFont('Arial','B',16);
        // mencetak string 
        $pdf->Cell(190,7,'UNIVERSITAS GARUDA',0,1,'C');
        $pdf->SetFont('Arial','B',12);
        $pdf->Cell(190,7,'LIST INVENTORI UNIVERSITAS GARUDA',0,1,'C');
        // Memberikan space kebawah agar tidak terlalu rapat
        $pdf->Cell(10,7,'',0,1);
        $pdf->SetFont('Arial','B',10);
        $pdf->Cell(20,6,'ID',1,0);
        $pdf->Cell(85,6,'NAMA',1,0);
        $pdf->Cell(27,6,'TIPE',1,0);
        $pdf->Cell(25,6,'KONDISI',1,0);
        $pdf->Cell(25,6,'JUMLAH',1,1);
        $pdf->SetFont('Arial','',10);
        $mahasiswa = $this->db->get('inventori')->result();
        foreach ($mahasiswa as $row){
            $pdf->Cell(20,6,$row->id,1,0);
            $pdf->Cell(85,6,$row->nama,1,0);
            $pdf->Cell(27,6,$row->is_device,1,0);
            $pdf->Cell(25,6,$row->kondisi,1,0);
            $pdf->Cell(25,6,$row->jumlah,1,1); 
        }
        $pdf->Output();
    }

    public function exportexcel()
    {
        $data['barang'] = $this->barang_model->tampil_data()->result();

        require(APPPATH. 'PHPExcel-1.8/Classes/PHPExcel.php');
        require(APPPATH . 'PHPExcel-1.8/Classes/PHPExcel/Writer/Excel2007.php');

        $object = new PHPExcel();

        $object->getProperties()->setCreator("Abimanyu BP");
        $object->getProperties()->setLastModifiedBy("Abimanyu BP");
        $object->getProperties()->setTitle("List Inventori Universitas Garuda");

        $object->setActiveSheetIndex(0);

        $object->getActiveSheet()->setCellValue('A1', 'NO');
        $object->getActiveSheet()->setCellValue('B1', 'ID');
        $object->getActiveSheet()->setCellValue('C1', 'NAMA');
        $object->getActiveSheet()->setCellValue('D1', 'TIPE');
        $object->getActiveSheet()->setCellValue('E1', 'STATUS');
        $object->getActiveSheet()->setCellValue('F1', 'JUMLAH');

        $baris = 2;
        $no = 1;
        
        foreach($data['barang'] as $mhs) {
            $object->getActiveSheet()->setCellValue('A' . $baris, $no++);
            $object->getActiveSheet()->setCellValue('B' . $baris, $mhs->id);
            $object->getActiveSheet()->setCellValue('C' . $baris, $mhs->nama);
            $object->getActiveSheet()->setCellValue('D' . $baris, $mhs->is_device);
            $object->getActiveSheet()->setCellValue('E' . $baris, $mhs->kondisi);
            $object->getActiveSheet()->setCellValue('F' . $baris, $mhs->jumlah);
            
            $baris++;
        }

        $filename = "Data Barang Universitas Garuda" . '.xlsx';

        $object->getActiveSheet()->setTitle("Data Barang");

        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');

        $writer=PHPExcel_IOFactory::createWriter($object, 'Excel2007');
        ob_end_clean();
        $writer->save('php://output');

        exit;
    }

    public function showgrafik()
    {
        $barang = $this->model->countBarang();
        $device = $this->model->countDevice();

        $data = array('barang' => $barang, 'device' => $device);

        $this->load->view("dahboard/dash_grafik_view", $data);
    }

}