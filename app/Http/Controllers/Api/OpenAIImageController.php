<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use OpenAI;

class OpenAIImageController extends Controller
{
    public function generateImage(Request $request)
    {
        $request->validate([
            'prompt' => 'required|string|max:255',
        ]);

        $client = OpenAI::client(config('services.openai.api_key'));

        $response = $client->images()->create([
            'prompt' => $request->prompt,
            'n' => 1,
            'size' => '256x256',
        ]);

        $imageUrl = $response->data[0]->url; // OpenAI Image URL

        // Define upload directory
        $root = $_SERVER['DOCUMENT_ROOT'];
        $currentDate = now()->format('d-m-y');
        $destinationPath = $root . '/pricecut/upload/ai-images/' . $currentDate . '/';


        if (!file_exists($destinationPath)) {
            mkdir($destinationPath, 0755, true);
        }

        // Generate a unique file name
        $imgName = time() . '_ai.png';
        $imagePath = $destinationPath . $imgName;

        // Download the image and save it
        $imageData = file_get_contents($imageUrl);
        file_put_contents($imagePath, $imageData);

        // Generate accessible URL
        $storedImageUrl = asset('upload/ai-images/' . $currentDate . '/' . $imgName);

        return response()->json([
            'success' => true,
            'image' => $imgName,
            'image_url' => $storedImageUrl,
        ]);
    }
}
