package br.com.karate;

import com.intuit.karate.junit5.Karate;

class RunKarateTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:br/com/karate/features").relativeTo(getClass());

    }

}
