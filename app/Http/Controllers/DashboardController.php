<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use App\Models\Produk;
use App\Models\Order;
use App\Models\OrderDetail;
use Validator;

class DashboardController extends Controller
{
    public function index() {
            $judulhalaman = 'Kasir';
            $title="Home";

            return view('dashboard.home',compact('judulhalaman','title'));
    }
    

    public function baranglist($bag=FALSE,$hal=FALSE) {
        $judulhalaman = 'Master Barang';
        $title="Barang";


        $data = Produk::get();

        return view('barang.barang_list',compact('judulhalaman','title','data'));
    }


    public function barangsave(Request $request) {
            $nama=$request->barang;
            $harga=$request->harga;
            $status=$request->status;

                if(!empty($nama) && !empty($harga)){
                    
                        $data = new Produk();
                        $data->nama_barang = $nama;
                        $data->harga_satuan = $harga;
                        $data->save();
                        
                        $response['response_status'] = true;
                        $response['response_message'] = "";
                } else {
                        $response['response_status'] = false;
                        $response['response_message'] = "";

                }
          
                
            echo json_encode($response);
    }
    
    public function barangsaveedit(Request $request) {
        $nama=$request->barang;
        $harga=$request->harga;
        $status=$request->status;

            $id=$request->idbarang;

            if(!empty($nama) && !empty($harga)){
                $update = Produk::where('id',$id)->update(['nama_barang' => $nama, 'harga_satuan' => $harga]); 

                $response['response_status'] = true;
                $response['response_message'] = "";
            } else {
                    $response['response_status'] = false;
                    $response['response_message'] = "";

            }
            
        echo json_encode($response);
    }
    
    public function viewbarang($id) {
                $data=Produk::where('id',$id)->first();
                
                echo json_encode($data);
    }


	public function deletebarang($id)
	{

            $barang = Produk::where('id',$id)->delete();

            $response['response_status'] = true;
            $response['response_message'] = "";

            echo json_encode($response);
	}


    

    public function belilist() {
        $judulhalaman = 'Pembelian Barang';
        $title="Pembelian Barang";


        $data = Order::get();

        return view('pembelian.pembelian_list',compact('judulhalaman','title','data'));
    }


    public function tambahbeli() {
        $judulhalaman = 'Tambah Pembelian';

        $databarang = Produk::get();

        $val_count="1";
        $count=Order::orderBy("idbeli","DESC")->first();

        if(!empty($count->idbeli)) { $val_count=substr($count->idbeli,2); $val_count+=1;}

        if($val_count<10) $strcount="00".$val_count;
        else if($val_count<100) $strcount="0".$val_count;
        
        $idtransaksi="TR".$strcount;
        
        $datadetail = OrderDetail::select('transaksi_pembelian_barang.*','master_barang.*')
                    ->leftJoin('master_barang','master_barang.id','=','transaksi_pembelian_barang.master_barang_id')
                    ->where('transaksi_pembelian_id',$idtransaksi)
                    ->get();



        return view('pembelian.tambahbeli',compact('judulhalaman','databarang','idtransaksi','datadetail'));
    }

    public function belisave(Request $request) {
        $idtransaksi=$request->idtransaksi;
        $idbarang=$request->idbarang;
        $jumlah=$request->jumlah;

            if(!empty($idbarang) && !empty($jumlah)){
                
                    $barang = Produk::select('harga_satuan')->where('id',$idbarang)->first();

                    $subtotal=$barang->harga_satuan*$jumlah;

                    $data = new OrderDetail();
                    $data->transaksi_pembelian_id = $idtransaksi;
                    $data->master_barang_id = $idbarang;
                    $data->jumlah = $jumlah;
                    $data->subtotal = $subtotal;
                    $data->save();
                    
                    $response['response_status'] = true;
                    $response['response_message'] = "";
            } else {
                    $response['response_status'] = false;
                    $response['response_message'] = "xx";

            }
      
            
        echo json_encode($response);
    }
	public function deletebeli($id)
	{

            $barang = OrderDetail::where('id',$id)->delete();

            $response['response_status'] = true;
            $response['response_message'] = "";

            echo json_encode($response);
	}


    public function belisaveall(Request $request) {
        $idtransaksi=$request->idtransaksi2;
        $total=$request->total;

            if(!empty($idtransaksi) && !empty($total)){
                
                    $data = new Order();
                    $data->idbeli = $idtransaksi;
                    $data->total_harga = $total;
                    $data->save();
                    
                    $responsex['response_status'] = true;
                    $responsex['response_message'] = "";
            } else {
                    $responsex['response_status'] = false;
                    $responsex['response_message'] = "zz";

            }
      
            
        echo json_encode($responsex);
    }

    
    public function viewbeli($idbeli) {
        $judulhalaman = 'View Pembelian';
        
        $idtransaksi=$idbeli;
        
        $datadetail = OrderDetail::select('transaksi_pembelian_barang.*','master_barang.*')
                    ->leftJoin('master_barang','master_barang.id','=','transaksi_pembelian_barang.master_barang_id')
                    ->where('transaksi_pembelian_id',$idtransaksi)
                    ->get();



        return view('pembelian.editbeli',compact('judulhalaman','idtransaksi','datadetail'));
    }
}
