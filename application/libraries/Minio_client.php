<?php
use Aws\S3\S3Client;

class Minio_client
{
    private $s3;
    private $bucket = 'edulite';   // sesuaikan

    public function __construct()
    {
        $this->s3 = new S3Client([
            'version'     => 'latest',
            'region'      => 'us-east-1',
            'endpoint'    => 'https://objectstorage.simsmk.sch.id',
            'use_path_style_endpoint' => true,     // WAJIB utk MinIO
            'credentials' => [
                'key'    => 'rendy',
                'secret' => 'Tahutelor123',
            ],
        ]);
    }

    /** upload & kembalikan URL public */
    public function upload($localPath, $key)
    {
        $result = $this->s3->putObject([
            'Bucket'     => $this->bucket,
            'Key'        => $key,
            'SourceFile' => $localPath,
            'ACL'        => 'public-read',
            'ContentType'=> mime_content_type($localPath),
        ]);
        return $result['ObjectURL'];        // URL final di MinIO
    }
}