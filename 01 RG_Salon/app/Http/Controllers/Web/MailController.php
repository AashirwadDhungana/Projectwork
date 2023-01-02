<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Mail\SentMail;
use App\Models\Category;
use App\Models\Notification;
use App\Models\Product;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{

   public function sentMail($reciever_id, Request $request)
   {
      $reciever = User::find($reciever_id);
      $mail_data['sub'] = $request->subject;
      $mail_data['message'] = $request->message;


      if ($reciever) {
         $sender = User::find(Auth::user()->id);
         $mail_data['email'] = $sender->email;
         $mail_data['name'] = $sender->name;
         $mail_data['reciever_name'] = $reciever->name;


         Mail::to($reciever->email)->send(new SentMail($mail_data));
      }
      return redirect()->back();
   }
}
