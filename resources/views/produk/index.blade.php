@extends('layouts/master')

@section('title')
    Daftar Produk
@endsection

@section('breadcrumb')
    @parent
    <li class="active">Daftar Produk</li>
@endsection

@section('content')
@if(session('success'))
    <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4><i class="icon fa fa-check"></i> Alert!</h4>
        {{ session('success') }}
    </div>
@endif
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
                <button onclick="addForm('{{ route('produk.store') }}')" class="btn btn-success btn-xs btn-flat"><i class="fa fa-plus-circle"> Tambah Kategori</i></button>
            </div>
            <div class="box-body table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <th width="5%">NO</th> 
                        <th>kode</th>
                        <th>nama</th>
                        <th>kategori</th>
                        <th>merk</th>
                        <th>harga beli</th>
                        <th>harga jual</th>
                        <th>stok</th>
                        <th width="15%"><i class="fa fa-cog"></i></th>
                    </thead>
                </table>
            </div>
          </div>
        </div>
      </div>

@includeIf('produk.form')
@endsection

@push('scripts')
<script>
    let table;

    $(function() {
        table = $('.table').DataTable({
            processing: true,
            autoWidth: false,
            serverSide: true,
            responsive: true,
            ajax: {
                url: '{{ route('produk.data') }}',
            },
            columns: [
                {data: 'DT_RowIndex', searchable: false, sortable: false},
                {data: 'kode_produk'},
                {data: 'nama_produk'},
                {data: 'nama_kategori'},
                {data: 'merk'},
                {data: 'harga_beli'},
                {data: 'harga_jual'},
                {data: 'stok'},
                {data: 'aksi', searchable: false, sortable: false},
            ]
        });

        $('#modal-form').validator().on('submit', function(e) {
            if(! e.preventDefault()) {
                $.post($('#modal-form form').attr('action'), $('modal-form form').serialize())
                .done((response) => {
                    $('#modal-form').modal('hide');
                    table.ajax.reload();
                })
                .fail((errors) => {
                    alert('Tidak dapat menyimpan data');
                    return;
                });
            }
        })
    });

    function addForm(url) {
        $('#modal-form').modal('show');
        $('#modal-form .modal-title').text('Tambah Produk');

        $('#modal-form form')[0].reset();
        $('#modal-form form').attr('action', url);
        $('#modal-form [name=_method]').val('post');
        $('#modal-form [name=nama_produk]').focus();
    }

    function editForm(url) {
        $('#modal-form').modal('show');
        $('#modal-form .modal-title').text('Edit Produk');

        $('#modal-form form')[0].reset();
        $('#modal-form form').attr('action', url);
        $('#modal-form [name=_method]').val('put');
        $('#modal-form [name=nama_produk]').focus();

        $.get(url)
        .done((response) => {
            $('#modal-form [name=nama_produk]').val(response.nama_produk);
            $('#modal-form [name=kode_produk]').val(response.kode_produk);
            $('#modal-form [name=id_kategori]').val(response.id_kategori);
            $('#modal-form [name=merk]').val(response.merk);
            $('#modal-form [name=harga_beli]').val(response.harga_beli);
            $('#modal-form [name=harga_jual]').val(response.harga_jual);
            $('#modal-form [name=stok]').val(response.stok);
        })
        .fail((errors) => {
            alert('Tidak dapat menampilkan data');
            return;
        });
    }

    function deleteData(url) {
        if (confirm('Yakin ingin menghapus data terpilih?')){
            $.post(url, {
                '_token': $('[name=csrf-token]').attr('content'),
                '_method': 'delete'
            })
            .done((response) => {
                table.ajax.reload();
            })
            .fail((errors) => {
                alert('Tidak dapat menghapus data');
                return;
            });
        }
    }
</script>
@endpush