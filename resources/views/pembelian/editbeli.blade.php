@extends('layoututama')
@section('content')

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{$judulhalaman}}</h1>
        <a href="{{url('transaksi')}}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-reply fa-sm text-white-50"></i> Kembali ke Pembelian</a>
    </div> 
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-3">ID Transaksi</div>
                <div class="col-lg-2"><input type="text"  name="idtransaksi" class="form-control" value="{{$idtransaksi}}" readonly></div>
            </div>
            
            <hr>
          <div class="row">
            <div class="col-lg-12">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    	            <thead>
                        <tr>
                            <th>No.</th>
                            <th>Nama Barang </th>
                            <th>Harga Satuan </th>
                            <th>Jumlah </th>
                            <th>Sub Total </th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no=1;$total=0;?>
                        @foreach($datadetail as $detail)
                            <tr>
                                <td>{{$no}}</td>
                                <td>{{$detail->nama_barang}}</td>
                                <td>Rp{{number_format($detail->harga_satuan)}}</td>
                                <td>{{$detail->jumlah}}</td>
                                <td>Rp{{number_format($detail->subtotal)}}</td>
                            </tr>
                            <?php $no++; $total+=$detail->subtotal;?>
                        @endforeach
					</tbody>
				</table>
			  </div>
			</div>
		  </div>
          <hr>
            <div class="row">
                <div class="col-lg-3"><b>TOTAL PEMBELIAN (RP)</b></div>
                <div class="col-lg-3"><input type="number" name="total"  class="form-control" value="{{$total}}" readonly></div>
            </div>
		</div>
	</div>
							
</div>
	<script src="{{url('app-assets/js/sweetalert2.all.min.js')}}"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>

        function deletebeli(iddata) {
            if (confirm('Anda yakin akan menghapus data?')) {
            // ajax delete data to database
            $.ajax({
                url: "{{url('deletebeli')}}/" + iddata,
                type: "GET",
                dataType: "JSON",
                success: function(data) {

                    call_alert('success', 'Success', 'Berhasil menghapus data.');
                    location.reload();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                call_alert('error', 'Warning', 'Gagal menghapus data.');
                }
            });

            }
        }



        var baseUrlx = "{{url('belisaveall')}}/";
        function allsavebeli() {
            var form = $('#form2')[0];
            var formData = new FormData(form);

            //btnLoader(true);

            $.ajax({
                url: baseUrlx + 'save',
                dataType: 'json',
                method: 'post',
                data: formData,
                contentType: false,
                processData: false,
                success: function(responsex) {
                    if (responsex.response_status) {
                        call_alert('success', 'Success', 'Data berhasil disimpan.');
                        window.location = ('/tambahbeli');
                    } else {
                        call_alert('error', 'Warning', 'Data gagal disimpan');
                    }
                },
                error: function() {
                    call_alert('error', 'Warning', 'There was an error entering data. Please re-enter the data.');
                }
            }); 
        }



        function call_alert(type, title, content, timer = '') {
            if (timer == '') {
                timer = 3000;
            }
            Swal.fire({
                allowOutsideClick: false,
                icon: type,
                title: title,
                timer: timer,
                text: content,
            }).then(() => { 

            });
        }


        var baseUrl = "{{url('belisave')}}/";
        function save() {
            var form = $('#form1')[0];
            var formData = new FormData(form);

            //btnLoader(true);

            $.ajax({
                url: baseUrl + 'save',
                dataType: 'json',
                method: 'post',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.response_status) {
                        call_alert('success', 'Success', 'Data berhasil disimpan.');
                        window.location = ('/tambahbeli');
                    } else {
                        call_alert('error', 'Warning', 'Data gagal disimpan');
                    }
                },
                error: function() {
                    call_alert('error', 'Warning', 'There was an error entering data. Please re-enter the data.');
                }
            }); 
        }

    </script>

    
@endsection
