package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

const greetingTemplate string = "Greetings to you, %s!"

func main() {
	r := gin.Default()
	r.GET("/greet/:name", func(c *gin.Context) {
		name := c.Params.ByName("name")
		c.String(http.StatusOK, fmt.Sprintf(greetingTemplate, name))
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
 

