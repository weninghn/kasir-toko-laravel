<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('setting')->insert([
            'id_setting' => 1,
            'nama_perusahaan' => 'Toko Kuning',
            'alamat' => 'Jl. Indah sejahtera Ds. Jimbaran',
            'telepon' => '085711859746',
            'tipe_nota' => 1, //kecil
            'diskon' => 5,
            'path_logo' =>'/img/toko.jpg',
        ]);
    }
}
