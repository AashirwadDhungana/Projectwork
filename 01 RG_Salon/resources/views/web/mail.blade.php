@component('mail::message')
Dear {{$mail_data['reciever_name']}},<br><br />
{!! $mail_data['message'] !!}<br>
Thanks,<br>
{{ $mail_data['name'] }}<br>
@endcomponent