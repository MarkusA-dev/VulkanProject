STB_INCLUDE_PATH = /usr/include/stb
TINY_OBJECT_LOADER_PATH = /usr/include/tinyobjloader
CFLAGS = -std=c++17 -O3 -I$(STB_INCLUDE_PATH) -I$(TINY_OBJECT_LOADER_PATH)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -DNDEBUG -o VulkanTest main.cpp $(LDFLAGS)
VulkanTestDBG: main.cpp
	g++ $(CFLAGS) -g -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test debug shaders clean

test: VulkanTest
	./VulkanTest

debug: VulkanTestDBG
	./VulkanTest

shaders:
	glslc ./shaders/shader.vert -o ./shaders/vert.spv
	glslc ./shaders/shader.frag -o ./shaders/frag.spv

clean:
	rm -f VulkanTest
	rm -f ./shaders/*.spv
