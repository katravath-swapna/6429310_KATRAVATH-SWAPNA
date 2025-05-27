module com.utils {
    exports com.utils;
}

// Utility.java in com.utils
package com.utils;

public class Utility {
    public static String greet(String name) {
        return "Hello, " + name;
    }
}

// module-info.java in com.greetings
module com.greetings {
    requires com.utils;
}

// Main.java in com.greetings
package com.greetings;

import com.utils.Utility;

public class Main {
    public static void main(String[] args) {
        System.out.println(Utility.greet("World"));
    }
}
