module my_addrx::Practice {
    use std::debug::print;
    friend my_addrx::FunctionVisibility;
    public(friend) fun integers(): u8 {
        //Integers
        let a:u8 = 23;
        return a
    }

    fun boolean() {
        let a:bool = true;
        let b = false;
        print(&a);
        print(&b);
    }

    fun addresses() {
        let named_address:address = @my_addrx;
        let numerical_address:address = @0x124;

        print(&named_address);
        print(&numerical_address)
    }
}

module my_addrx::FunctionVisibility {
    use std::debug::print;

    fun call_test() {
        let c:bool = true;
        print(&c);
    }

    fun call_practice(): u8 {
        return my_addrx::Practice::integers()
        
    }
}


module my_addrx::References {
    use std::debug::print;

    fun immutable_reference() {
        let a = 10;
        let b = &a;
        print(b);
    }

    fun mutable_reference() { 
        let a = 23;
        let b = &mut a;
        print(b);

        *b = 25;
        print(b);
    }

    
}


module my_addrx::Vectors {
    use std::debug::print;
    use std::vector;

    fun borrow() {
        let a = vector<u64> [10, 20, 30, 40];
        print(&a);

        *vector::borrow_mut(&mut a, 1) = 25;
        let b = *vector::borrow(&a, 1);

        print(&b);
    }

    fun push_back() {
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);

        let b = *vector::borrow(&a, 4);
        print(&b);
    }

    fun pop_back() { 
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);
        vector::pop_back(&mut a);

        let b = *vector::borrow(&a, 4);

        print(&b);
    }

    fun swap() {
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);
        vector::swap(&mut a, 0, 4);
        let b = *vector::borrow(&a, 4);
        print(&b);
        print(&a);
    }

    fun reverse() {
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);
        vector::reverse(&mut a);

        print(&a);
    }

    fun reverse_slice() {
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);
        vector::reverse_slice(&mut a, 0, 5);

        print(&a);
    }

    fun append() {
        let a = vector<u64> [10, 20, 30, 40];
        let b = vector<u64> [50, 60, 70, 80];

         vector::append(&mut a, b);

        print(&a);
    }

    fun trim() {
        let a = vector<u64> [10, 20, 30, 40];
        vector::push_back(&mut a, 50);

        
       let trimmed: vector<u64> =  vector::trim(&mut a, 3);

        print(&a);
        print(&trimmed);
    }

    fun length( a: vector<u64>): u64 {
        let b = vector::length(&a);

        return b
    }

    fun loop_function() {
        let a = vector<u64> [10, 20, 30, 40, 50, 60];
        let i = 0;
        let size = length(a);


        while (i < size) {
            let e = vector::borrow_mut(&mut a, i);
            *e = *e + 1;
            i = i + 1;  

            
        };
        


        print(&a);
        print(&size);

    }

    fun remove() {
        let a = vector<u64> [10, 20, 30, 40, 50, 60];
        let b = vector::remove(&mut a, 2);

        print(&a);
        print(&b);
    }


    fun variables() {
        let a = 1;
        print(&a);

        a = 2;
        print(&a);
    }
}

module my_addrx::Strings {
    use std::debug::print;
    use std::string::{String, utf8, bytes};

    fun string_to_utf8() { 
        let s:String = utf8(b"Hello World!");
        print(&s);

        let b = bytes(&s);
        print(b);
    }

    #[test]
    fun test_string() {
        string_to_utf8()
    }
}