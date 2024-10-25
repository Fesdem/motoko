// This is an expense tracker, to follow up on amount saved over a period of time.
// The first result showed what was saved in percentage
// The second result showed the difference between the target set and the actual
// amount saved at the end.

import Debug "mo:base/Debug";
import Float "mo:base/Float";

actor ExpenseTracker {
  var availableValue = 0.0;
  var savingValue = 0.0;
  var savingPercentage = 0.0;
  var spending = 0.0;
  var savedAmount = 0.0;
  // var saved = 0.0;
  // var i = 0.0;

  // let id = 123423234432;
  // Debug.print(debug_show(id));

  private func availableamountInBank(amount : Float) : Float {
    availableValue := amount;
    Debug.print(debug_show (availableValue));
    return availableValue;
  };

  private func savingsTarget(savings : Float) : Float {
    savingValue := savings;
    Debug.print(debug_show (savings));
    return savingValue;
  };

  private func savingsPercentage(amount : Float, save : Float) :  Float {
    var available = availableamountInBank(amount);
    var saving = savingsTarget(save);
    savingPercentage := (saving / available * 100);
    Debug.print(debug_show (savingPercentage));
    return savingPercentage;
    
  };

  private func amountSpent(spent: Float) : Float {
    spending := spent;
    Debug.print(debug_show(spending));
    return spending;
  };

   private func amountSaved(amount : Float, spent: Float) : Float {
    var available = availableamountInBank(amount);
    var spend = amountSpent(spent);
    savedAmount := available - spend;
    var m = savedAmount / available * 100;
    
    Debug.print(debug_show(savedAmount));
    return m;
  };



  public query func percentage(amountInTheBank : Float, amountSpent: Float, amountToSave: Float) : async Text {
    var savedPercentag = savingsPercentage(amountInTheBank, amountToSave);
    var amountSave = amountSaved(amountInTheBank, amountSpent);

    var diffSaved = amountSave - savedPercentag;
    Debug.print(debug_show(diffSaved));
    Debug.print(debug_show(amountSave));
    return "The amount saved in percentage is " #   Float.toText(amountSave) # " the difference between your target and actual amount saved is " # Float.toText(diffSaved) #  ".";
    
  };

};
