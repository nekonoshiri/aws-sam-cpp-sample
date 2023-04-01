#include <iostream>
#include <aws/lambda-runtime/runtime.h>

using namespace std;
using namespace aws::lambda_runtime;

static invocation_response handler(invocation_request const& req) {
  std::cout << "request payload: " << req.payload << std::endl;
  return invocation_response::success(R"({"message": "Hello, AWS Lambda!"})", "application/json");
}

int main() {
  run_handler(handler);
  return 0;
}
