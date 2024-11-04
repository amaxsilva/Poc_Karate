function fn() {
    var env = karate.env || 'qa'; // define 'qa' como padrão se 'env' estiver vazio
    var config = karate.read('classpath:br/com/karate/domain/config.yaml')[env];

    karate.configure('ssl', true);
    //karate.configure('logPrettyRequest', true); // Logar as requisições de forma bonita
    //karate.configure('logPrettyResponse', true); // Logar as respostas de forma bonita

    karate.log('karate.env system property was:', env);

    // Adiciona o token ao objeto de configuração
    config.token = 'seu_token';

    config.randomEmail = function() {
        return 'user' + Math.floor(Math.random() * 10000) + '@example.com';
    };

    // Função para gerar nomes aleatórios
    config.randomName = function() {
        var firstNames = ['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo', 'Fernanda', 'Gustavo', 'Helena', 'Igor', 'Juliana', 'Karina', 'Lucas', 'Mariana', 'Natalia', 'Pedro', 'Rafaela', 'Tiago', 'Vanessa','Lucas'];
        var lastNames = ['Silva', 'Santos', 'Oliveira', 'Souza', 'Lima', 'Pereira', 'Ferreira', 'Alves', 'Ribeiro', 'Cavalcante', 'Carvalho'];
        var firstName = firstNames[Math.floor(Math.random() * firstNames.length)];
        var lastName = lastNames[Math.floor(Math.random() * lastNames.length)];
        return firstName + ' ' + lastName;
    }

    return config;
}
