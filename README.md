# s3proxy
You can't access the URL which is generated by the Amazon S3 website hosting service from a completely private network because the URL is associated with a public IP address.<br>
So how do we access it? I think one of the answers is that you create the reverse proxy server like Nginx but I tried to build API Gateway as a reverse proxy.<br>
Once you build it, the building environment is much easier than installing Nginx to EC2 instance.

## Technology
Private API Gateway associate with VPC Endpoint(com.amazonaws.REGION.execute-api). Then you can access API Gateway privately.

![s3proxy-entire](https://user-images.githubusercontent.com/18078024/115163783-031bae00-a0e6-11eb-8e83-0d7bb9713d0d.png)

## Prerequisite
### AWS Environment
Check below envirionment.
- Create AWS Account.([Guide](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/?nc1=h_ls))
- Install AWS CLI on your machine.([Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
- Create IAM User or IAM Role for executing AWS CLI.([IAM user Creation Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html), [IAM role Creation Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user.html))

You need to attach 'AdministratorAccess' which is AWS managed IAM policy to IAM role or user you created.

### Cloudformation Parameter
You can customize the parameters in template.yml. The meaning of each parameter is below.

| Parameter | Value |
| ----- | ----- |
| VpcCidr | VPC CIDR which API Gateway Endpoint is deployed. |
| APIGatewaySubnetCidr | Subnet CIDR which API Gateway Endpoint is deployed. |
| S3BucketName | S3 Bucket name which the frontend file is deployed must be unique in global. |
| APIGatewayStageName | API Gateway stage name.(Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.) |
| NameTagKey | All resources template.yml create have a part of Key Value. This parameter define Key. |
| NameTagValue | All resources template.yml create have a part of Key Value. This parameter define Value. |

## How to use
Just execute AWS CLI below.
```
aws cloudformation create-stack --stack-name s3proxy --region <Your region code> --capabilities CAPABILITY_NAMED_IAM --template-body file://template.yml
```
Then you can create the environment like this below.

![s3proxy](https://user-images.githubusercontent.com/18078024/115163201-be424800-a0e2-11eb-805f-f302b7c8a773.png)

## Author
* **Kento Kashiwagi** - [tuimac](https://github.com/tuimac)
If you have some opinion and find bugs, please post [here](https://github.com/tuimac/s3proxy/issues).

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
