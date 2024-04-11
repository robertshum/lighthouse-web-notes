# AWS S3 to deploy static front end

Using:

* AWS S3

## Steps

1. Build your project.  For Vite, the build folder is ```dist``` and is compiled with ```npm run build```
2. Navigate to S3 in AWS.
3. Create bucket (with default settings)
   1. Choose name
   2. Uncheck 'Block all public access' (will need to do some investigation which flags should be checked in future)
4. Click `Create Bucket` and wait.
5. Configure bucket.
   1. Properties > Static website hosting: Edit + Enable.
   2. Permissions > Bucket Policy: Edit + paste in a policy (see example below).
6. Finally, go to Objects > Upload the contents of the dist/build folder.  The bucket should have ```assets/``` folder, ```index.html``` and other static assets in the root folder.
7. Test the static site that is officially hosted on S3!

## Useful Commands

...

## Notes:
- For the default bucket policy, I use the standard one here:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::NAME_OF_S3_BUCKET/*"
        }
    ]
}
```