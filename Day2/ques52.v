module task_display;
  task display_msg;
    begin
      $display("Hello from Verilog Task!");
      $display("Learning Tasks is fun.");
    end
  endtask

endmodule