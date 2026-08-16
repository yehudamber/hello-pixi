#ifdef USE_INCLUDES
#include <print>
#else
import std;
#endif

int main(int argc [[maybe_unused]], char* argv[])
{
    std::println("Hello from {}", argv[0]);
}
