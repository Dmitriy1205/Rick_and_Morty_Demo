mixin GqlQuery {
  static String characterQuery = '''
 query {
      characters(page: 1){
         results{
             id
             name
             status
             gender
             type
             species
             image
         }
      } 
    } 
 ''';
  static String locationsQuery = '''
  query {
     locations{
        results{
           id
           name
           type
           dimension
        }
      }
    }       
  ''';
  static String episodesQuery = '''      
  query{
    episodes{
    results{
        id
        name
        episode
        air_date
        }
      }
    }
  
  ''';
}
