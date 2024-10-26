# resource "local_file" "test" {
#     filename = "test.txt"
#     content = "Hello testfile updated again"
#     lifecycle {
#       create_before_destroy = true
#     }
    
# }