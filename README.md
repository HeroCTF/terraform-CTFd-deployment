# Terraform CTFd deployment

## Gettings started

Go to the GCP [console](https://console.cloud.google.com/iam-admin/serviceaccounts/) and create a JSON key file.

```bash
$ git clone https://github.com/HeroCTF/terraform-CTFd-deployment
$ cd terraform-CTFd-deployment
$ mv <JSON_key_file> accounts.json
```

Then, you can modify the deployment settings in `main.tf` and launch :

```
$ terraform init
$ terraform plan
$ terraform apply
``` 
