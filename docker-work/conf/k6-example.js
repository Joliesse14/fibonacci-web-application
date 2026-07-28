import http from "k6/http";

export const options = {
  vus: 10,
  iterations: 50000,
};

export default function () {
  http.get("http://apache/demo.php");
  // apache/enqueue.php
  // apache/doinsert.php
  // tomcat:8080/hello
  // tomcat:8080/enqueue
}
