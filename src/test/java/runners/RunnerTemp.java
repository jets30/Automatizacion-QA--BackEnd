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
public class RunnerTemp {

   @Test
    void testParallel() {

        Results results =
                  Runner.path("classpath:features")
                .tags("@create_successful_pet")
                .parallel(1);

        assertEquals(
                0,
                results.getFailCount(),
                results.getErrorMessages()
        );
    }

}
