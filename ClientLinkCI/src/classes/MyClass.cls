public with sharing class MyClass {
   static testMethod void myTest() {
    Account a = new Account(name='foo');
    insert a;
    System.assertEquals('foo', [select name from Account where id=:a.id].name);
    System.assertEquals(1, [select count() from Account where id=:a.id]);
    try {
      delete a;
      Foo.myMethod(a); //call some method
    } catch (DmlException e) {
      System.assert(false);  // assert that we should never get here
    }
 }

    
}