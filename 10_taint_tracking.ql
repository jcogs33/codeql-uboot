/* 
Question 2.1: Create the configuration class, by defining the source and sink. 
The source should be calls to ntohl, ntohll, or ntohs. 
The sink should be the size argument of an unsafe call to memcpy.

Hint: The source should be an instance of the class you wrote in part 2.0.
Hint: The sink should be the size argument of calls to memcpy.
*/

/**
* @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
  // 2.0 Todo 
  NetworkByteSwap() { // characteristic predicate
    exists(MacroInvocation mi |
      mi.getMacro().getName().regexpMatch("ntoh(ll|l|s)") and
      this = mi.getExpr()
    )
  }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
      // 2.1 Todo
      // The source should be calls to ntohl, ntohll, or ntohs.
      // The source should be an instance of the class you wrote in part 2.0.

      // exists(MacroExpression me |
      //   source.asExpr() = me
      // ) 

      // use instanceof instead of above
      source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
     // 2.1 Todo
     // The sink should be the size argument of an unsafe call to memcpy.
     // The sink should be the size argument of calls to memcpy.
     exists(FunctionCall fc | 
      fc.getTarget().getName() = "memcpy" and
      sink.asExpr() = fc.getArgument(2)
     )
  } // was missing from boilerplate
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "ntoh flows to memcpy"

