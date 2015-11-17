package helpers

import (
	"bytes"
)

func StringConcat(strings ...string) string {

	var buffer bytes.Buffer
	for _, v := range strings {
		buffer.WriteString(v)
	}
	return buffer.String()
}
