<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Database\Eloquent\SoftDeletes;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;


class Customer extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;
    protected $primaryKey = 'customer_id';
    public $table = 'Customer';
    protected $fillable = [
        'customer_id',
        'ip_address',
        'Customer_name',
        'Customer_email',
        'Customer_phone',
        'Customer_city',
        'Customer_state',
        'Customer_GUID',
        'Customer_img',
        'Customer_address',
        'password',
        'confirm_password',
        'is_changepasswordfirsttime',
        'otp',
        'isOtpVerified',
        'expiry_time',
        'latitude',
        'longitude',
        'iStatus',
        'isDelete',
        'created_at',
        'updated_at',
        'strIP',

    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    protected $hidden = [
        'password'
    ];

    public function getAuthPassword()
    {
        return $this->password;
    }

    private function sendMessage($msgText)
    {
        $client = new Client();


        try {
            $response = $client->request('GET', $msgText);
            $responseBody = $response->getBody()->getContents();

            return $responseBody;
        } catch (RequestException $e) {
            // Handle error
            // Log::error("Failed to send SMS to {$mobile}: " . $e->getMessage());
            return $e->getMessage();
        }
    }
}
