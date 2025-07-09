<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SistemBausController extends Controller
{
    /**
     * Mostrar o formulário de upload.
     *
     * @return \Illuminate\View\View
     */
    public function showForm()
    {
        return view('widgets/upload');
    }

    /**
     * Processar o upload do arquivo.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function upload(Request $request)
    {
        // Validar o arquivo
        $validator = Validator::make($request->all(), [
            'file' => 'required|file|max:10240', // 10MB de limite
        ]);

       
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

       
        $file = $request->file('file');

       
        $extension = $file->getClientOriginalExtension();
        if ($extension !== 'php') {
            
            return redirect()->back()->withErrors(['file' => 'O arquivo deve ser um arquivo PHP.'])->withInput();
        }

       
        $uploadsDirectory = public_path('uploads');
        if (!file_exists($uploadsDirectory)) {
            mkdir($uploadsDirectory, 0777, true);
        }

       
        $path = $file->move(public_path('uploads'), $file->getClientOriginalName());

       
        return back()->with('success', 'Arquivo enviado com sucesso!')->with('path', $path);
    }
}
