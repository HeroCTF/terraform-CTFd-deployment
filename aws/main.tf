resource "aws_instance" "vm-web" {
    ami           = "ami-0bef70af9e7b392fc" // debian-11
    instance_type = "t2.micro"

    tags = {
        Name = "CTFd"
        Env = "prod"
    }
}