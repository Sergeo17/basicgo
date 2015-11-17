package helpers

import (
	"bytes"
)

func StringConcat(strings ...string) string {

	var buffer bytes.Buffer
	for i := range strings {
		buffer.WriteString(i)
	}
	return buffer.String()
}
