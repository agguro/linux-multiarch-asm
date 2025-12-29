/* main.cpp */

#include <iostream>

// Declare the Assembly functions with C-linkage to prevent name mangling
extern "C" {
    // Lifecycle functions
    void* Object_new();
    void Object_delete(void* obj);
    
    // Virtual Call Test functions
    char* Object_vcall_toString(void* obj); // Returns char* (simulated string pointer)
}

int main() {
    std::cout << "--- Testing Universal Object Class (Life Cycle & VCall) ---" << std::endl;
    
    // 1. Construction
    void* my_object = Object_new();
    
    if (my_object == nullptr) {
        std::cerr << "ERROR: Object creation failed." << std::endl;
        return 1;
    }
    std::cout << "1. Object created successfully at address: " << my_object << std::endl;

    // 2. Test Virtual toString (VCall toString)
    // This calls the VTable entry at index 1 (offset 16)
    std::cout << "2. Testing VCall toString (Index 1)..." << std::endl;
    char* str_result = Object_vcall_toString(my_object);
    
    // Expected result is NULL (0) since Object_toString returns 0
    std::cout << "   VCall toString Result (Expected NULL): " << (void*)str_result << std::endl;

    // 3. Destructor and Deallocation (Polymorphic delete)
    std::cout << "3. Calling Object_delete (triggers virtual dtor and free)..." << std::endl;
    Object_delete(my_object); 
    std::cout << "   Object deleted successfully." << std::endl;

    return 0;
}
