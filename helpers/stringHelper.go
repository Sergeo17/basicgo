package helpers

import (
	"bytes"
)

func StringConcat(strings ...string) string {

	var buffer bytes.Buffer
	for i, v := range strings {
		buffer.WriteString(v)
	}
	return buffer.String()
}
