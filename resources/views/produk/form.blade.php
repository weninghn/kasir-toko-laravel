<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form">
  <div class="modal-dialog" role="document">
    <form action="" method="POST" class="form-horizontal">
        @csrf
        @method('post')
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="nama_produk" class="col-md-2 col-md-offset control-label"> Nama</label>
                        <div class="col-md-9">
                            <input type="text" name="nama_produk" id="nama_produk" class="form-control" required autofocus>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="nama_produk" class="col-md-2 col-md-offset control-label"> Produk</label>
                        <div class="col-md-9">
                            <select name="id_kategori" id="id_kategori" class="form-control">
                                <option value="">Pilih Kategori</option>
                                @foreach ($kategori as $key => $item)
                                <option value="{{ $key }}">{{ $item }}</option>
                                @endforeach
                            </select>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="merk" class="col-md-2 col-md-offset control-label"> Merk</label>
                        <div class="col-md-9">
                            <input type="text" name="merk" id="merk" class="form-control" required autofocus>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="harga_beli" class="col-md-2 col-md-offset control-label"> Harga Beli</label>
                        <div class="col-md-9">
                            <input type="number" name="harga_beli" id="harga_beli" class="form-control" required autofocus>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="harga_jual" class="col-md-2 col-md-offset control-label"> Harga Jual</label>
                        <div class="col-md-9">
                            <input type="number" name="harga_jual" id="harga_jual" class="form-control" required autofocus>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="stok" class="col-md-2 col-md-offset control-label"> Stok</label>
                        <div class="col-md-9">
                            <input type="number" name="stok" id="stok" class="form-control" required autofocus>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-flat btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-flat btn-primary">Save</button>
                </div>
            </div>
    </form>
  </div>
</div>