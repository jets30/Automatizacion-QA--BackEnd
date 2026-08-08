/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package runners;

import com.intuit.karate.junit5.Karate;

/**
 *
 * @author ABEL
 */
public class TestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features/users");
    }

}
