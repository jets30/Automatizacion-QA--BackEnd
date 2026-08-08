/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package runners;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

/**
 *
 * @author ABEL
 */
public class ParallelRunner {
   @Test
    void testParallel() {

        Results results =
                Runner.path("classpath:features")
                        .parallel(3);

       
        assertEquals(
                0,
                results.getFailCount(),
                results.getErrorMessages()
        );
    }
}
