CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)
VulkanTestDBG: main.cpp
	g++ $(CFLAGS) -g -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test debug clean

test: VulkanTest
	./VulkanTest

debug: VulkanTestDBG
	./VulkanTest

clean:
	rm -f VulkanTest
