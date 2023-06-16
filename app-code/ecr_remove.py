import boto3  

def delete_images(repository_name, num_images_to_keep):
    ecr_client = boto3.client('ecr', region_name='eu-central-1') 
    response = ecr_client.describe_images(repositoryName=repository_name)

    image_details = response['imageDetails']
    image_details.sort(key=lambda x: x['imagePushedAt'], reverse=True)

    images_to_delete = image_details[num_images_to_keep:]

    for image in images_to_delete:
        image_digest = image['imageDigest']
        ecr_client.batch_delete_image(
            repositoryName=repository_name,
            imageIds=[
                {
                    'imageDigest': image_digest
                }
            ]
        )
        print(f'Deleted image: {image_digest}')

repository_name = '815111324020.dkr.ecr.eu-central-1.amazonaws.com/stepanyan'
num_images_to_keep = 5   # remove aws ecr images vichy 5

delete_images(repository_name, num_images_to_keep)

