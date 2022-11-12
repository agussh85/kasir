@extends('layoututama')
@section('content')


<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{$judulhalaman}}</h1>
        <a href="{{url('tambahbeli')}}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-plus fa-sm text-white-50"></i> Tambah Pembelian</a>
    </div> 
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    	            <thead>
                        <tr>
                            <th>No.</th>
                            <th>ID Transaksi</th>
                            <th>Tanggal </th>
                            <th>Total </th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
						<?php 
						$no=1;
						foreach($data as $beli) { ?>
							<tr>
							<td>{{$no}}</td>
							<td>{{$beli->idbeli}}</td>
							<td>{{$beli->created_at}}</td>
							<td>Rp{{number_format($beli->total_harga)}}</td>
							<td>
							<a href="{{url('viewbeli')}}/<?= $beli->idbeli ?>" class="btn btn-sm btn-success"><span class="fa fa-edit"></span> View</a>
							</td>
							</tr>
						<?php $no++; } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
							
</div>

	<script src="{{url('app-assets/js/sweetalert2.all.min.js')}}"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
        function add_barang() {
            save_method = 'add';
            $('#form1')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('#modal-barang').modal('show'); // show bootstrap modal
            $('.modal-title').text('Tambah Barang'); // Set Title to Bootstrap modal title
        }

        function viewdata(id) {
            save_method = 'update';
            $('#form2')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            //Ajax Load data from ajax
            $.ajax({
                url: "{{url('viewbarang')}}/" + id,
                type: "GET",
                dataType: "JSON",
                success: function(data) {

                    $('[name="idbarang"]').val(data.id);
                    $('[name="barang"]').val(data.nama_barang);
                    $('[name="harga"]').val(data.harga_satuan);

					$('#modal-data').modal('show'); // show bootstrap modal when complete loaded              
                    $('.modal-title').text('Edit Barang'); // Set title to Bootstrap modal title

                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('Error get data from ajax');
                }
            });
        }

        function deletedata(iddata) {
            if (confirm('Anda yakin akan menghapus data?')) {
            // ajax delete data to database
            $.ajax({
                url: "{{url('deletebarang')}}/" + iddata,
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


        var baseUrl = "{{url('barangsave')}}/";
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
                        window.location = ('/baranglist');
                    } else {
                        call_alert('error', 'Warning', 'Data gagal disimpan');
                    }
                },
                error: function() {
                    call_alert('error', 'Warning', 'There was an error entering data. Please re-enter the data.');
                }
            }); 
        }

        var baseUrl = "{{url('barangsaveedit')}}/";
        function saveedit() {
            var form = $('#form2')[0];
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
                        window.location = ('/baranglist');
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

    
<div class="modal fade" id="modal-barang">
    <div class="modal-dialog" style="width:600px">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Barang</h4>
            </div>
            <div class="modal-body">
                <form action="#" id="form1" name="form1" class="form-horizontal" enctype="multipart/form-data" novalidate="novalidate">
					{{csrf_field()}}
					<input type="hidden" class="form-control" id="_token"  name="_token" value="{{csrf_token()}}">
                    <input type="hidden" name="idbarang" id="idbarang" value="">
                    <input type="hidden" name="status" id="status" value="add">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-6 control-label">Nama Barang</label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="barang" placeholder="" name="barang" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4 control-label">Harga Satuan</label>

                        <div class="col-sm-12">
                            <input type="number" class="form-control" id="harga" placeholder="" name="harga" required="">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Batal</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="modal-data">
    <div class="modal-dialog" style="width:600px">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Barang</h4>
            </div>
            <div class="modal-body">
                <form action="#" id="form2" name="form2" class="form-horizontal" enctype="multipart/form-data" novalidate="novalidate">
                	{{csrf_field()}}
					<input type="hidden" class="form-control" id="_token"  name="_token" value="{{csrf_token()}}">    
					<input type="hidden" name="idbarang" id="idbarang" value="">
                    <input type="hidden" name="status" id="status" value="update">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-6 control-label">Nama Barang</label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="barang" placeholder="" name="barang" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-4 control-label">Harga Satuan</label>

                        <div class="col-sm-12">
                            <input type="number" class="form-control" id="harga" placeholder="" name="harga" required="">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="saveedit()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Batal</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
@endsection
