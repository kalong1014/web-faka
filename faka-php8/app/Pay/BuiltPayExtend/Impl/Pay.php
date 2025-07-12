<?php
declare(strict_types=1);

namespace App\Pay\BuiltPayExtend\Impl;

use App\Entity\PayEntity;
use App\Model\Config;
use App\Pay\Base;
use App\Util\Plugin;
use App\Util\Str;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\GuzzleException;
use Kernel\Exception\JSONException;

/**
 * Class Pay
 * @package App\Pay\Kvmpay\Impl
 */
class Pay extends Base implements \App\Pay\Pay
{
    /**
     * @return PayEntity
     * @throws JSONException
     */
    public function trade(): PayEntity
    {
        $client = new Client(["verify" => false]);
        $postData = [
            'trade_no' => $this->tradeNo,
            'amount' => $this->amount,
            'type' => $this->code,
            'notification_url' => $this->callbackUrl,
            'return_url' => $this->returnUrl
        ];
        $postData['sign'] = Str::generateSignature($postData, Plugin::getConfig("BuiltPay")['app_key']);
        try {
            $callbackDomain = trim(Config::get("callback_domain"), "/");
            if (!$callbackDomain) {
                $callbackDomain = \App\Util\Client::getUrl();
            }
            $request = $client->post($callbackDomain . '/plugin/builtPay/api/trade', [
                "form_params" => $postData
            ]);
        } catch (GuzzleException $e) {
            throw new JSONException("内部错误，请联系插件开发商");
        }
        $contents = $request->getBody()->getContents();
        $json = json_decode((string)$contents, true);

        if ($json['code'] != 200) {
            throw new JSONException((string)$json['msg']);
        }
        $url = $json['data']['url'];
        $payEntity = new PayEntity();
        $payEntity->setType(self::TYPE_REDIRECT);
        $payEntity->setUrl($url);
        return $payEntity;
    }
}