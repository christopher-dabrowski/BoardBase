package example;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.neo4j.procedure.Name;
import org.neo4j.procedure.Procedure;

public class ParseKingNames {
  @Procedure(name = "kd.parseKingName")
  public Stream<KingName> parseKingName(@Name("kingName") String kingName) {
    if (kingName == null || kingName.trim().isEmpty()) {
      return Stream.empty();
    }

    if (!kingName.contains("/")) {
      return Stream.of(new KingName(kingName));
    }

    List<String> result = new ArrayList<>();
    String[] parts = kingName.split(" ", 2);

    if (parts.length == 0) {
      return Stream.empty();
    }

    String firstPart = parts[0];
    String restOfName = parts.length > 1 ? parts[1] : "";

    String[] firstNames = firstPart.split("/");

    for (String firstName : firstNames) {
      String trimmedFirstName = firstName.trim();
      if (!trimmedFirstName.isEmpty()) {
        if (!restOfName.isEmpty()) {
          result.add(trimmedFirstName + " " + restOfName);
        } else {
          result.add(trimmedFirstName);
        }
      }
    }

    return result.stream().map(KingName::new);
  }

  public static class KingName {
    public String name;

    public KingName(String name) {
      this.name = name;
    }
  }
}
