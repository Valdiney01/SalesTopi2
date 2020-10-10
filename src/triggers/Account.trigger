trigger Account on Account (before insert, before update) {
 	new AccountTH().run();   
    System.debug('Acionou a Trigger');
}